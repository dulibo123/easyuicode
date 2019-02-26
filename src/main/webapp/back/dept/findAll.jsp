<%@page pageEncoding="UTF-8" isELIgnored="false" %>


    <script>

        $(function () {
            $("#btn").datagrid({
                toolbar:'#tb..',
                fitColumns:true,
                width:1150,
                height:430,
                 autoRowHeight:true,
                url:'${pageContext.request.contextPath}/dept/queryAll',
                pagination:true,
                columns:[[
                    {field:'cks',title:'cks',width:100,checkbox:true},
                    {field:'id',title:'id',width:100},
                    {field:'no',title:'部门编号',width:100},
                    {field:'name',title:'部门名称',width:100},
                    {field:'number',title:'部门人数',width:100},
                    {field:'createDate',title:'创建时间',width:100},
                    {field:'edit',title:'操作',width:100,formatter:function(value,row,index){
                                return "<a href='javascript:;' class='options' onclick=\"delrow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',height:28,plain:true\">删除</a>&nbsp;&nbsp;<a href='javascript:;' onclick=\"openUpdate('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-edit',plain:true\">修改</a>";
                        },}
                ]],
                onLoadSuccess:function(){
                    $('.options').linkbutton();

                }
            });
        });
        //打开添加用户界面
       function openSave() {
            $("#saveUserDialog").dialog({

                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户数据
                        $("#saveUser").form('submit',{

                            url:'${pageContext.request.contextPath}/dept/save',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                             var parseJSON = $.parseJSON(result);
                                if (parseJSON.success){
                                 //提示信息
                                 $.messager.show({title:'提示',msg:"用户添加成功!!!"});
                             }else {
                                 $.messager.show({title: '提示', msg: parseJSON.message});
                             }
                                 //关闭对话框
                                 $("#saveUserDialog").dialog('close');
                                 //刷新datagrid
                                 $("#btn").datagrid('reload');

                             }
                            });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#saveUserDialog").dialog('close');
                    }
                }]
            })
       }
       //打开修改用户界面
        function openUpdate(id){
            $("#editUserDialog").dialog({
            href:'${pageContext.request.contextPath}/back/dept/update.jsp?id='+id,
                buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function(){
                        //保存用户数据
                        $("#updateUser").form('submit',{

                            url:'${pageContext.request.contextPath}/dept/update',
                            success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                                var parseJSON = $.parseJSON(result);
                                if (parseJSON.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"用户修改成功!!!"});
                                }else {
                                    $.messager.show({title: '提示', msg: parseJSON.message});
                                }
                               //关闭对话框
                                $("#editUserDialog").dialog('close');
                                //刷新datagrid
                                $("#btn").datagrid('reload');
                            }
                        });
                    }
                },{
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function(){
                        $("#editUserDialog").dialog('close');
                    }
                }]
            });
          // buttons:[{}]
        }
        //批量删除
        function openDeleteALl(){
           var datagrid1 = $("#btn").datagrid("getChecked");
           if(datagrid1.length<=0){
               $.messager.show({title:'提示',msg:'至少选择一行'});
           }else{
               var ids=[];
               for(var i=0;i<datagrid1.length;i++){
                   ids.push(datagrid1[i].id);
               }
               console.log(ids);
               $.ajax({
                   url:'${pageContext.request.contextPath}/dept/deleteAll',
                   type:"POST",
                   traditional:true,
                   data:{ids:ids},
                   success:function (parseJSON) {
                       console.log(parseJSON.success);
                       // var parseJSON = $.parseJSON(result);
                       if (parseJSON.success){
                           //提示信息
                           $.messager.show({title:'提示',msg:"用户删除成功!!!"});
                       }else {
                           $.messager.show({title: '提示', msg: parseJSON.message});
                       }

                       //刷新datagrid
                       $("#btn").datagrid('reload');

                   }/*, error:function(){
                       //消息提示
                       $.messager.show({title:'提示',msg:"删除失败!!!"});
                       //刷新datagrid
                       $("#btn").datagrid('reload');
                   }*/
               })

            }


        }
        //删除一行数据的事件
        function delrow(id){
            //发送ajax请求
            $.post("${pageContext.request.contextPath}/dept/delete",{"id":id},function (result) {

                //刷新datagrid数据
                 $("#btn").datagrid("reload");
        });
        }
    </script>
</head>
<body>
    <table id="btn"></table>
    <%--创建工具栏--%>
    <div id="tb">
        <a  onclick="openSave()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
        <a  onclick="openDeleteALl()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    </div>

    <%--保存用户对话框--%>
        <div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/back/dept/save.jsp',width:600,height:400,title:'增加用户信息界面',iconCls:'icon-save'"></div>
    <%--更新用户对话框--%>
    <div id="editUserDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>
