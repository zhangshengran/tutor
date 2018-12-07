API

说明



    status：  0表示成功，1表示失败
   message:具体的消息信息


获取验证码：
        接口：/verify
        请求：GET
        参数：stu_phone   手机号
        调用形式：/verify?stu_phone=15690580872
        成功返回值：
                {
                    status:0,
                    stu_phone,//用户收到的验证码
                    message:'请求成功'
                }
              
            }
        错误返回值:{
                   status:1,
                   message:errorMessage
            }    
            );




学生注册：
        接口：/register_stu
        请求：POST
        参数：stu_phone  手机号
             stu_password  密码
        调用形式：/register_stu
        成功返回值：
                {
                    status:0,
                    info    : 'OK',
                    message:'注册成功'
                }
              
            }
        错误返回值:{
                   status  : 1,
                info    : 'error',
                message:'注册失败'
            }    
            );          


学生登陆：
        接口：/login
        请求：POST
        参数：stu_phone  手机号
             stu_password  密码
        调用形式：/login
        成功返回值：
                {
                    status:0,
                    info    : 'OK',
                    token:(用户tokenID)
                    message:'登陆成功'
                }
              
            }
        错误返回值:{
                   status  : 1,
                info    : 'error',
                message:'登陆失败'
            }    
            );      