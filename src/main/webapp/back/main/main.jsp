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
          $.post("${pageContext.request.contextPath}/back/main/menu.json",function (menu) {
              console.log(menu);
              $.each(menu,function (index,m) {
                  console.log("fdgf"+m.children);
                  var content="<div style='text-align: center'>";
                  $.each(m.children,function (idx,child) {
                      content+="<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px #00ee00 solid;' class='easyui-linkbutton' data-options=\"iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br/>"
              })
                  content+="</div>"
                  $("#menu").accordion('add',{
                      title:m.name,
                      iconCls:m.iconCls,
                      content:content
                  })
              })
          });
       });
       function addTabs(name,iconCls,href) {
          // alert(name);
           if(!$("#tabs").tabs("exists",name)){
               $("#tabs").tabs('add',{
                   title:name,
                   iconCls:iconCls,
                   closable:true,
                   fit:true,
                   href:"${pageContext.request.contextPath}/"+href
               })
           }else{
               $("#tabs").tabs("select",name)
           }

           
       }
    </script>
</head>
<body>
<div id="cc" class="easyui-layout" style="width:600px;height:400px;" data-options="fit:true">
    <%--头部--%>
    <div data-options="region:'north',split:false,href:'${pageContext.request.contextPath}/back/main/head.jsp'" style="height:100px;text-align: center"></div>
    <%--尾部--%>
    <div data-options="region:'south',split:false,href:'${pageContext.request.contextPath}/back/main/footer.jsp'" style="height:100px;text-align: center"></div>
    <%--左侧--%>
    <div data-options="region:'west',title:'系统菜单',split:false" style="width:260px;">
        <div id="menu" class="easyui-accordion" data-options="fit:true"></div>
    </div>
    <%--中间--%>
    <div data-options="region:'center',fit:true" style="background:#eee;">
        <%--选项卡--%>
        <div id="tabs" class="easyui-tabs" data-options="fit:true"> </div>
    </div>
</div>

</body>
</html>
