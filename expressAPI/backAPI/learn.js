var aliyun = require('../config/config');
var con = require('../config/config').con;
var fs = require('fs');
var multer = require('multer');
var upload = multer({ dest: 'upload_tmp/' });


exports.deVideo = function (req, res) {
    var id = req.query.id;
    con.query('delete from video where id = ?', [id], (err, result) => {
        if (err) {
            res.send(
                {
                    status: 1,
                    message: '数据库错误'
                }
            )
        } else {
            res.send(
                {
                    status: 0,
                    info: 'ok',
                    message: '删除成功'
                }
            )
        }
    });
}

exports.createVideo = async function (req, res) {

    var course_name = req.body.course_name;
    var course_time = req.body.course_time;
    var course_author = req.body.course_author;

    console.log(req.files[0]);  // 上传的文件信息
    console.log(req.body);
    
    var time = new Date().getTime();
    var des_file = "./upload_tmp/" + time+req.files[0].originalname;
    await fs.rename(req.files[0].path, des_file, function (error) {
        if (error) {
            console.log(error);
        }
    })
    //   res.send('OK');
    // path为指定阿里云OSS的上传位置（记得加 ‘/’，例如 head/，filename为上传的文件命名，temfile为本地服务器存储位置）
    // 本函数返回最后上传的文件url
    var course_src = await aliyun.aliyunPUT_community('/video', req.files[0].originalname, des_file);
    var sql = 'insert into video(course_src,course_name,course_time,course_author) values(?,?,?,?)';
    await con.query(sql, [course_src, course_name, course_time, course_author], (err, result) => {
        if (err) {
            res.send(
                {
                    status: 1,
                    message: '数据库错误'
                }
            )
        } else {
            console.log('修改名字成功');
            console.log(req.session);
            res.send('上传成功');
        }
    })

}





// -------------------------------------------
