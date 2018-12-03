
const mysql = require('mysql'),
con = mysql.createConnection({
    host: '39.105.111.123',
    user: 'root',
    password: 'xingyun2016',
    database: 'tutor'
});

function add_tea(tea_id, tea_password,callback) {
        // con.connect();
        con.query('insert into teachers(tea_id,tea_password) values(?,?)',
            [tea_id, tea_password], (err, result) => {
                if (err) {
                    return false;
                }else
                { 
                    return true;
               
                }
            });
        // con.end();
    }


    function add_stu(stu_id, stu_pwd) {
        // con.connect();
        con.query('insert into students(stu_id,stu_password) values(?,?)',
            [stu_id, stu_pwd], (err, result) => {
                if (err) {
                    return false;
                }else
                { 
                    console.log('OK');
                  
                    return true;
               
                }
            });
        // con.end();
    }


exports.register_tea = function(req,res){
    console.log(req.body);
    var tea_id = req.body.tea_id;
    var tea_password = req.body.tea_pwd;
    add_tea(tea_id, tea_password)
 
    res.json({ res_code: 1,res_massage:'注册成功'});
}

exports.register_stu = function(req,res){
    console.log(req.body);
    var stu_id = req.body.stu_id;
    var stu_password = req.body.stu_pwd;
    add_stu(stu_id, stu_password)
    // console.log('OK2');
    res.json({ res_code: 1,res_massage:'注册成功'});
}