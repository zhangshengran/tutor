const mysql = require('mysql'),
con = mysql.createConnection({
    host: '39.105.111.123',
    user: 'root',
    password: 'xingyun2016',
    database: 'tutor'
});


  function  select_tea(id,callback) {
            con.query('select tea_password from teachers where tea_id = ?', [id], (err, result) => {
            
                if (err) {
                    return false;
                }else
                {                     
                      callback(result);
                      return result;
                }
                
            });
        } 
        
        function  select_stu(id,callback) {
            con.query('select stu_password from students where stu_id = ?', [id], (err, result) => {
            
                if (err) {
                    return false;
                }else
                { 
                    
                      callback(result);
                      return result;
                }
                
            });
        } 
        
        
   



module.exports ={
    select_tea:select_tea,
    select_stu:select_stu
}