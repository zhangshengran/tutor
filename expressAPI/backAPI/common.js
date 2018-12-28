var aliyun = require('../config/config');
var con = require('../config/config').con;


exports.getStu = function(req,res){
    con.query('select * from students',(err,result)=>{
        if(err){
            res.send(
                {
                    status:1,
                    message:'数据库错误'
                }
            )
        }else{
            res.json(result);
        }
    })
}
exports.deStu = function(req,res){
    var stu_id = req.query.stu_id;


    con.query('delete from students where stu_id = ?', [stu_id], (err, result) => {
        if (err) {
            res.send(
                {
                    status:1,
                    message:'数据库错误'
                }
            )
        }else
        { res.send(
            {
                status:0,
                info:'ok',
                message:'删除成功'
            }
        )}
    });

}

exports.showOrders = function(req,res){
    con.query('select * from order2',(err,result)=>{
        if(err){
            res.send(
                {
                    status:1,
                    message:'数据库错误'
                }
            )
        }else{
            res.json(result);
        }
    })
}








//建议查询
exports.advicesel = function(req,res){

    var adv_user = req.query.adv_user;
    if(!adv_user){
        con.query('SELECT * FROM advice', function(err,result) {
            if (err) {
              res.send({
                status  : 1, 
                info    : 'error',
                message:'系统错误' 
            });
            }else{
              res.json(result);
            }
            })
    }else{
        con.query('SELECT * FROM advice where adv_user = ?',[adv_user], function(err,result) {
            if (err) {
              res.send({
                status  : 1, 
                info    : 'error',
                message:'系统错误' 
            });
            }else{
              res.json(result);
            }
            })
    }
   
}

// 写建议

exports.writeAdvice =  function(req, res, next) {

    var adv_user = req.body.adv_user;
    var adv_content = req.body.adv_content;
    var adv_time = req.body.adv_time;

      con.query('insert into advice(adv_user,adv_content,adv_time) values(?,?,?)',[adv_user,adv_content,adv_time], function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    }else{
        res.send({
            status  : 0,
            info    : 'ok',
            message:'建议成功' 
        });
    }
    
    })
  }


//回复
exports.reply =  function(req, res, next) {

    var adv_id = req.body.adv_id;
    var reply = req.body.reply;


      con.query('update advice set reply = ? where adv_id = ?',[reply,adv_id], function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    }else{
        res.send({
            status  : 0,
            info    : 'ok',
           
        })
    }
    
    })
  }


//   /删除建议
  exports.advicedel = function(req, res, next) {
      
  
      var adv_id = req.query.adv_id;
      console.log(adv_id);
        con.query('delete FROM advice where adv_id = ?',[adv_id], function(err,result) {
      if (err) {
        res.send({
          status  : 1,
          info    : 'error',
          message:'系统错误' 
      });
      }
      })
    }
  
//头条查询接口
exports.toutiaosel =  function(req, res, next) {

    con.query('SELECT * FROM toutiao', function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    }else{
      res.json(result);
      console.log(result);
    }
    })
  }
  
  //头条增加接口
  exports.toutiaoadd =  function(req, res, next) {
  
  
    var toutiao_id = req.body.toutiao_id;
    var toutiao_title = req.body.toutiao_title;
    var toutiao_content = req.body.toutiao_content;
    
  
  
      con.query('insert into toutiao(tou_content) values(?)',[toutiao_content], function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    console.log(err);
    }
    })
  }
  
  //头条删除接口
  exports.toutiaodel = function(req, res, next) {
      
  
    var tou_id = req.query.tou_id;
    console.log(tou_id);
      con.query('delete FROM toutiao where tou_id = ?',[tou_id], function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    }
    })
  }


  //查询接口
exports.lunbo_sel =  function(req, res, next) {
  
    con.query('SELECT * FROM lunbo', function(err,result) {
      if (err) {
        res.send({
          status  : 1,
          info    : 'error',
          message:'系统错误' 
      });
      }else{
        res.json(result);
       
      }
      })
    }
  
  //轮播删除接口
exports.lun_del = function(req, res, next) {

    var lun_id = req.query.lun_id;
    con.query('delete FROM lunbo where lun_id = ?',[lun_id], function(err,result) {
      if (err) {
        res.send({
          status  : 1,
          info    : 'error',
          message:'系统错误' 
      });
      }else{
        res.json(result);
      }
      })
    };



    
//轮播图增加接口
exports.lunbo_add = function(req, res, next) {

    var lun_id = req.body.lun_id;
    var lun_name = req.body.lun_name;
    var lun_src = req.body.lun_src;

      con.query('insert into lunbo(lun_id,lun_name,lun_src) values(?,?,?)',[lun_id,lun_name,lun_src], function(err,result) {
    if (err) {
      res.send({
        status  : 1,
        info    : 'error',
        message:'系统错误' 
    });
    }
    else{
      res.json(result);
    }
    })
  };
