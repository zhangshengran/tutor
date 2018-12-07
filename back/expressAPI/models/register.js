



const mysql = require('mysql'),
    con = mysql.createConnection({
        host: '39.105.111.123',
        user: 'root',
        password: 'xingyun2016',
        database: 'tutor'
    });



// 验证码接口
exports.verify = function(req,res){
    console.log(req.query);
    var stu_phone = req.query.stu_phone;//获得请求的手机号
    var tpl_value = Math.round(Math.random()*10*10*10*10*10)//获得随机5位验证码

    console.log(stu_phone)

    var queryData = querystring.stringify({
        "mobile": stu_phone,  // 接受短信的用户手机号码
        "tpl_id": "119441",  // 您申请的短信模板ID，根据实际情况修改
        "tpl_value": "#code#="+tpl_value,  // 您设置的模板变量，根据实际情况修改
        "key": "3fd6da67a69d793673fc069c1cbb8868",  // 应用APPKEY(应用详细页查询)
    });
  
    var queryUrl = 'http://v.juhe.cn/sms/send?'+queryData;
    
    request(queryUrl, function (error, response, body) {
        if (!error && response.statusCode == 200) { 
            // console.log(body) // 打印接口返回内容      
            var jsonObj = JSON.parse(body); // 解析接口返回的JSON内容 
            console.log(jsonObj);
            if(jsonObj.error_code !== 0)
            {
                res.send({
                    status:1,
                    message:jsonObj.reason
                });
            }else{
                res.send({
                    status:0,
                    tpl_value,
                    message:jsonObj.reason
                });
            }
        } else {
            res.send({
                status:1,
                message:'请求失败'
            });
        }
    }) 
}


// 学生注册接口
exports.register_stu = function (req, res) {
    // console.log(req);
    console.log(req.body);
    
    // console.log(req.headers);
   
    var stu_phone = req.body.stu_phone;
    var stu_password = req.body.stu_password;
    console.log("获得的账号"+stu_phone,"获得的密码"+stu_password);
    con.query('insert into students(stu_phone,stu_password) values(?,?)',
    [stu_phone, stu_password], (err, result) => {
        if (err) {
            res.send({
                status  : 1,
                info    : 'error',
                message:'注册失败' 
            });
           
        } else {
            res.send({
                status  : 0,
                info    : 'OK',
                message:'注册成功'
            });
        }
    });

}

// 学生补全信息