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

    console.log(course_name);  // 上传的文件信息
    console.log(req.body);
    console.log(req.files);
    var time = new Date().getTime();
    var type = req.files[0].mimetype.split('/')[1];
    var name =  course_name+time+'.'+type;
    var des_file = "./upload_tmp/" + name;
    await fs.rename(req.files[0].path, des_file, function (error) {
        if (error) {
            console.log(error);
        }
    })
    //   res.send('OK');
    // path为指定阿里云OSS的上传位置（记得加 ‘/’，例如 head/，filename为上传的文件命名，temfile为本地服务器存储位置）
    // 本函数返回最后上传的文件url
    var course_src = await aliyun.aliyunPUT_learn('video/', name, des_file);
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
            res.send( {
                status: 0,
                message: 'OK'
            });
        }
    })

}





// -------------------------------------------

exports.writeNew = async function (req, res) {

    var header = req.body.header;
    var content = req.body.content;
    var src = req.body.src;
    var time = req.body.time;
    var  sql = 'insert into ;learnNews(header,content,src,time) values(?,?,?,?)'
    await con.query(sql, [header,content,src, time], (err, result) => {
        if (err) {
            res.send(
                {
                    status: 1,
                    message: '数据库错误'
                }
            )
        } else {
            res.send( {
                status: 0,
                message: 'OK'
            });
        }
    })

}
exports.delNews = function (req, res) {
    var id = req.query.id;
    con.query('delete from learnNews where id = ?', [id], (err, result) => {
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

exports.upLearnFile = async function (req, res) {

    var file_name = req.body.file_name;
    var upload_time = req.body.upload_time;
    var upload_peo = req.body.upload_peo;
    var fileVerify = req.body.fileVerify;
    var srore = req.body.srore;
    
     
  // 上传的文件信息
    console.log(req.body);
    console.log(req.files);

    // res.send('OK1');
    var time = new Date().getTime();
    var type = req.files[0].mimetype.split('/')[1];
    var name =  file_name+time+'.'+type;
    var des_file = "./upload_tmp/" + name;
    await fs.rename(req.files[0].path, des_file, function (error) {
        if (error) {
            console.log(error);
        }
    })
     
    
    var file_src = await aliyun.aliyunPUT_learn('material/', name, des_file);
    var sql = 'insert into learnFile(file_name,upload_time,upload_peo,fileVerify,srore,file_src) values(?,?,?,?,?,?)';
    await con.query(sql, [file_name,upload_time,upload_peo,fileVerify,srore,file_src], (err, result) => {
        if (err) {
            res.send(
                {
                    status: 1,
                    message: '数据库错误'
                }
            )
        } else {
            res.send( {
                status: 0,
                message: 'OK'
            });
        }
    })

}


exports.delLearnFile = function (req, res) {
    var id = req.query.id;
    con.query('delete from learnFile where id = ?', [id], (err, result) => {
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


exports.delposter = function (req, res) {
    var co_id = req.query.co_id;
    con.query('delete from community where co_id = ?', [co_id], (err, result) => {
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


