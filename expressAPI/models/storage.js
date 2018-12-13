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




// exports.upload_head = async function (req, res, next) {
//   console.log(req.body)
//   console.log(req.body.stu_id);
//   var stu_id = req.body.stu_id;
//   if(!stu_id){
//     res.send({
//       status:1,
//       info:'error',
//       message:'请输入学生ID'
//     })
//   }else{
//     if(req.files.length==0){
//       res.send({
//         status:1,
//         info:'error',
//         message:'请上传图片'
//       })
//     }else{
//       var filestyle = req.files[0].originalname.split('.')[1];
//       var file = stu_id + '.' + filestyle; //自定义文件名
//       var timestamp=new Date().getTime();
//       var des_file = "./upload_tmp/" +timestamp+ file;
//       await fs.rename(req.files[0].path, des_file)
//       var url = await put('head/', file, des_file);
//       await con.query( 'UPDATE students SET head_src = ? WHERE stu_id = ?',[url,stu_id],(err,result)=>{
//         if(err){
//           res.send({
//             status:1,
//             info:'error',
//             message:'数据库错误'
//           })
//         }
//       });
//         res.send({
//           status:0,
//           headurl:url,
//           info:'ok',
//           message:'成功'
//         })
//     }
//   }
//   // console.log(req.files[0]);  // 上传的文件信息
 
  
// }





exports.upload_head = async function (req, res, next) {
 
  var stu_id = req.body.stu_id;
  console.log(req.body.stu_id);
  console.log(req.files)

  // [{ 
  // stu_id:把当前账号的stu_id包装进来
  // fieldname: 'file',
  // originalname: 'file',
  // encoding: '7bit',
  // mimetype: 'image/jpeg',
  // destination: 'upload_tmp/',
  // filename: '256cba791609986221b5d03d25eb26a4',
  // path: 'upload_tmp/256cba791609986221b5d03d25eb26a4',
  // size: 63620 } ]
  if(req.files.length==0){
    res.send(
     'error，请上传图片'
    )
  }else{
    var filetype = req.files[0].mimetype.split('/')[1];//获取传上来的文件类型
    var file = req.files[0].stu_id + '.' + filetype; //自定义文件名
    var timestamp=new Date().getTime();
    var des_file = "./upload_tmp/" +timestamp+ file;
    await fs.rename(req.files[0].path, des_file)
    var url = await put('head/', file, des_file);
    res.send('OK');
  }
  
}