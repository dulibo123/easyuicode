<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/black/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>
       $(function () {
            $("#w").dialog({
                buttons:[{
                    text:'登陆',
                    handler:function(){
                         $("#ff").form('submit',{
                             url:'${pageContext.request.contextPath}/user/queryOne',
                            success:function (result) {
                                if (result=="back/main/login") {
                                   location.href="${pageContext.request.contextPath}/back/main/main.jsp";
                                }else{
                                    location.href="${pageContext.request.contextPath}/back/main/login.jsp";

                                }

                            }
                        });
                    }
                },{
                    text:'注册',
                    handler:function(){}
                }]

            })
        })

        function dologin(){

        }
    </script>
</head>
<body>
<form  id="ff" class="easyui-form" method="post">
<div id="w" class="easyui-dialog" title="请先登录"
     data-options="modal:true,iconCls:'Lockgo',closable:false,minimizable:false"
     style="width:400px;padding:20px 70px 20px 70px;">


    <div style="margin-bottom:10px">
        <input name="user.username" class="easyui-textbox" id="logname" style="width:100%;height:30px;padding:12px" data-options="prompt:'登录用户名',iconCls:'icon-man',iconWidth:38">
    </div>
    <div style="margin-bottom:20px">
        <input name="user.password" class="easyui-textbox" id="logpass" type="password" style="width:100%;height:30px;padding:12px"
               data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38">
    </div>
   <%-- <div style="margin-bottom:20px">
        <input class="easyui-textbox" type="text" id="logyzm" style="width:50%;height:30px;padding:12px"
               data-options="prompt:'验证码'"> <a href="javascript:;" class="showcode" onclick="changeVeryfy()"><img
            style=" margin:0 0 0 3px ; vertical-align:middle; height:26px;" src="http://www.baidu.com/img/baidu_jgylogo3.gif"></a>
    </div>--%>
    <div style="margin-bottom:20px">
        <input type="checkbox" checked="checked" id="logrem">
        <span>Remember me</span>
    </div>
  <%--  <div>
        <a  onclick="dologin()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           style="padding:5px 0px;width:100%;">
            <span style="font-size:14px;">登录</span>
        </a>

    </div>--%>
    </form>

</div>


</body>
</html>