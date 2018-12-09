var con = require('./db').con;

exports.order_set = function (req, res) {
    var stu_id = req.body.stu_id;
    var tea_id = req.body.tea_id;
    var order_time = req.body.order_time;
    var order_address = req.body.order_address;
console.log(stu_id);
console.log(tea_id);
console.log(order_time);
console.log( order_address);

    con.query('insert into order2(stu_id,tea_id,order_address,order_time)  values(?,?,?,?)',
        [stu_id,tea_id, order_address, order_time], (err, result) => {
            if (err) {
              
                res.send({
                    status: 1,
                    info: 'error2',
                    message: '数据库写入错误'
                   
                })
            }else{
                res.send({
                    status: 0,
                    info: 'OK',
                    message: '订单生成成功'
                })
            }
        })
}