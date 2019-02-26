<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {

       $("#updateUser").form('load','${pageContext.request.contextPath}/dept/findOne?id=${param.id}');

    })
</script>
<div style="text-align:center">
    <form  id="updateUser" class="easyui-form" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div  style="margin-top: 70px">
            部门编号：<input type="text" name="no" class="easyui-textbox"  data-options="required:true,validType:'uname'"><br/>
        </div>
        <div style="margin-top: 20px">
            部门名称：<input type="text" name="name" class="easyui-textbox"><br/>
        </div>

        <div style="margin-top: 20px">
            部门人数：<input type="text" name="number" class="easyui-textbox"><br/>
        </div>
        <div style="margin-top: 20px">
            创建时间：<input type="text" name="createDate" class="easyui-datebox"><br/>
        </div>



    </form>
</div>