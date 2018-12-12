var con = require('./db').con;

exports.writeNote = function (req, res) {
    var poster_id = req.body.poster_id;
    var content = req.body.content;
    var img_src1 = req.body.img_src1;
    con.query('insert into community(poster_id,content,img_src1) values(?,?,?)',[poster_id,content,img_src1],(err,result)=>{
            if(err){
                res.send({
                    status: 1,
                    info: 'error',
                    message: '服务器错误，发帖失败'
                })
            }else{
                res.send({
                    status: 0,
                    info: 'ok',
                    message: '发帖成功'
                })
            }
    })

}
exports.selectAllNotes = function(req,res){
    
}