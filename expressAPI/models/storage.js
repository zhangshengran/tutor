let OSS = require('ali-oss');
var fs = require('fs');
var con = require('./db').con;

let client = new OSS({
  region: 'oss-cn-beijing',
  accessKeyId: 'LTAILzRjytI5AIO8',
  accessKeySecret: 'VtwJkolPmWi0k3RvxKqtG5v1wMSBWm',
  bucket: 'tutor666',
});


async function put(path, filename, temfile) {
  try {
    let result = await client.put(path + filename, temfile);
    var url = result.url;//文件读取地址
   return new Promise((resolved)=>{
     resolved(url);
   })
  } catch (err) {
    console.log(err);
  }
}




exports.upload = async function (req, res, next) {
  console.log(req.body.stu_id);
  var stu_id = req.body.stu_id;
  // console.log(req.files[0]);  // 上传的文件信息
  var filestyle = req.files[0].originalname.split('.')[1];
  var file = stu_id + '.' + filestyle; //自定义文件名
  var timestamp=new Date().getTime();
  var des_file = "./upload_tmp/" +timestamp+ file;
  await fs.rename(req.files[0].path, des_file)
  var url = await put('head/', file, des_file);
  await con.query( 'UPDATE students SET head_src = ? WHERE stu_id = ?',[url,stu_id],(err,result)=>{
    if(err){
      res.send({
        status:1,
        info:'error',
        message:'数据库错误'
      })
    }
  });
    res.send({
      status:0,
      info:'ok',
      message:'成功'
    })
}



