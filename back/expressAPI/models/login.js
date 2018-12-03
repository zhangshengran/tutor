const mysql = require('mysql'),
con = mysql.createConnection({
    host: '39.105.111.123',
    user: 'root',
    password: 'xingyun2016',
    database: 'tutor'
});


  function  select_tea(id,callback) {
            con.query('select password from login where userId = ?', [id], (err, result) => {
            
                if (err) {
                    return false;
                }else
                { 
                    //   console.log("查询结果是"+result);
                      callback(result);
                      return result;
                }
                
            });
        } 
        
        function  select_stu(id,callback) {
            con.query('select password from login where userId = ?', [id], (err, result) => {
            
                if (err) {
                    return false;
                }else
                { 
                    //   console.log("查询结果是"+result);
                      callback(result);
                      return result;
                }
                
            });
        } 
        
        
   



module.exports ={}