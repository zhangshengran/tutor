API
获取验证码：
        接口：/verify
        请求：GET
        参数：stu_phone   手机号
        调用形式：/verify?stu_phone=15690580872
        成功返回值：
                {
                    status:0,
                    stu_phone,
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
                    tpl_value,
                    message:'请求成功'
                }
              
            }
        错误返回值:{
                   status:1,
                   message:'请求失败'
            }    
            );          