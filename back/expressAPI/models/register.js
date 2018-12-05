
const mysql = require('mysql'),
    con = mysql.createConnection({
        host: '39.105.111.123',
        user: 'root',
        password: 'xingyun2016',
        database: 'tutor'
    });

// 成为老师
exports.register_tea =function (req, res) {
    console.log(req.body);
    var tea_name = req.body.tea_name;
    var tea_age = req.body.tea_age;
    var tea_sex = req.body.tea_sex;
    var tea_phone = req.body.tea_phone;
    var tea_email = req.body.tea_email;
    var tea_range = req.body.tea_range;
    var tea_course = req.body.tea_course;
    var tea_school = req.body.tea_school;
    var tea_major = req.body.tea_major;
    var tea_grade = req.body.tea_grade;
    var tea_introduction = req.body.tea_introduction;
    
    con.query('insert into teachers(tea_name,tea_age,tea_sex,tea_phone,tea_email,tea_range,tea_school,tea_major,tea_grade,tea_introduction) values(?,?,?,?,?,?,?,?,?,?)',
    [tea_name,tea_age,tea_sex,tea_phone,tea_email,tea_range,tea_course,tea_school,tea_major,tea_grade,tea_introduction], (err, result) => {
        if (err) {
            res.send({
                status  : 0,
                info    : 'error'
            });
        } else {
            res.send({
                status  : 1,
                info    : 'ok'
            });
        }
    });
   
}



// 学生注册接口
exports.register_stu = function (req, res) {
    console.log(req.body);
    var stu_id = req.body.stu_id;
    var stu_password = req.body.stu_pwd;
   
    con.query('insert into students(stu_id,stu_password) values(?,?)',
    [stu_id, stu_password], (err, result) => {
        if (err) {
            res.send({
                status  : 0,
                info    : 'error'
            });
        } else {
            res.send({
                status  : 1,
                info    : 'ok'
            });
        }
    });

}

// 学生补全信息