const mysql = require('mysql'),
con = mysql.createConnection({
    host: '39.105.111.123',
    user: 'root',
    password: 'xingyun2016',
    database: 'tutor'
});
      
        exports.select_stu= function(req,res) {
           var stu_phone = req.body.stu_phone;
           var stu_password =  req.body.stu_password;
            con.query('select stu_password,stu_id from students where stu_phone = ?', [stu_phone], (err, result) => {
            
                if (err) {
                    res.send( {
                        status:1,
                        info    : 'error',
                        message:'数据库连接失败'
                    })
                }else
                {    
                console.log('数据库查到的ID' + result[0].stu_id);              
                console.log('数据库查到的密码' + result[0].stu_password);
                if(result[0].stu_password ==stu_password)
                {
                    
                    res.send( {
                        status:0,
                        info    : 'OK',
                        tokenID:result[0].stu_id,
                        message:'密码匹配正确'
                    })
                }
                else
                {
                    res.send( {
                        status:1,
                        info    : 'error',
                        message:'密码匹配错误'
                    })
                }
               
                
                }
                
            });
        } 
        