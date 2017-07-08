<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updateAdmin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="admin_bootstrap/css/bootstrap.min.css" />
<style type="text/css">
body {
	
}

#reg {
	margin-top: 8%;
}
</style>
</head>

<body>

	<div class="container-fluid" id="reg">
		<div class="row">
			<h1 class="col-xs-3 col-sm-3 col-xs-offset-4">
				<b>管理员密码修改</b>
			</h1>
		</div>
		<lable id="hidd"> <input type="hidden" id="adminsid"
			value="<s:property value='#session.curr_admin.adminsid'/>" /> <input
			type="hidden" id="hpwd"
			value="<s:property value='#session.curr_admin.pwd'/>" /> </lable>
		<div class="row">
			<div class="form-group has-feedback col-xs-5 col-xs-offset-3">
			<span class="label label-primary">用户名</span>
				<label class="control-label" for="name"> </label><input type="text"
					class="form-control input-lg"
					value="<s:property value="#session.curr_admin.name"/>" id="name"
					disabled>

			</div>
		</div>
		<div class="row">
			<div class="form-group has-feedback col-xs-5 col-xs-offset-3">
			<span class="label label-primary">原密码</span>
				<label class="control-label" for="pwd"> </label> <input
					type="password" class="form-control input-lg" placeholder="原密码"
					id="pwd">
			</div>
		</div>
		<div class="row">
			<div class="form-group has-feedback col-xs-5 col-xs-offset-3">
			<span class="label label-primary">新密码</span>
				<label class="control-label" for="newpwd"> </label> <input
					type="password" class="form-control input-lg" placeholder="新密码"
					id="newpwd" value="<s:property value="#admin.pwd"/>">
			</div>
		</div>
		<div class="row">
			<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-3"
				type="button" value="修改密码" onclick="updatePwd()" id="updatePwd">
				<b>修改密码</b>
			</button>
			<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
				type="button" value="Reset" onclick="reset()" id="reset">
				<b>重置</b>
			</button>
		</div>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		function updatePwd() {
			for (var i = 3; i < 5; i++) {
				if ($("input:eq(" + i + ")").val().trim() == "") {
					layer.tips($("input:eq(" + i + ")").attr("placeholder")
							+ "不能为空!", $("input:eq(" + i + ")"));
					return;
				}
			}
			var adminsid = $('#adminsid').val();
			var name = $('#name').val();
			var hpwd = $('#hpwd').val();
			var pwd = $('#pwd').val();
			var newpwd = $('#newpwd').val();
			if (hpwd == pwd) {
				var jsonStr = {
					'admin.adminsid' : adminsid,
					'admin.name' : name,
					'admin.pwd' : newpwd
				};
				$.getJSON("admin_update", jsonStr, function(result) {
					if (result.flag) {
						layer.msg('密码修改成功！');
						return;
					} else {
						layer.msg('密码修改失败！');
						return;
					}
				});
			} else {
				layer.msg('原密码输入不正确！');
				return;
			}
		}
		function reset() {
			$("input").val("");
		}
	</script>
</body>
</html>
