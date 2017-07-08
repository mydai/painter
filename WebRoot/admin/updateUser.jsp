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

<title>My JSP 'updateUser.jsp' starting page</title>

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

#updateUsers {
	margin-top: 5%;
}

#left {
	margin-left: 5%;
	width: 60%;
	float: left;
}

#right {
	width: 35%;
	float: left;
	height: 35%;
}

.loadfile {
	margin-top: 15%;
	display: block;
	width: 200px;
	height: 200px;
	line-height: 200px;
	font-size: 60px;
	text-align: center;
	border: 1px solid #ccc;
	font-size: 60px;
}

.bg_size {
	background-repeat: no-repeat;
	background-size: 200px 200px;
}
</style>
</head>

<body>

	<form action="user_updateUser" enctype="multipart/form-data"
		method="post" id="updateUserform">
		<div class="" id="updateUsers">
			<div class="container-fluid" id="left">
				<div class="row">
					<h1 class="col-xs-5 col-sm-5 col-xs-offset-2">
						<b>用户信息修改</b>
					</h1>
				</div>
				<lable id="hidd"> <input type="hidden" id="userid"
					value="<s:property value='user.userid'/>" name="user.userid" /> </lable>

				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">用户名</span> <label
							class="control-label" for="name"> </label><input type="text"
							class="form-control input-lg"
							value="<s:property value='user.name'/>" id="name"
							name="user.name" >
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">密码</span> <label
							class="control-label" for="pwd"> </label> <input type="text"
							class="form-control input-lg" placeholder="密码" id="pwd"
							name="user.pwd" value="<s:property value="user.pwd"/>"
							onblur="check(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">邮箱</span> <label
							class="control-label" for="email"> </label> <input type="text"
							class="form-control input-lg" placeholder="邮箱" id="email"
							name="user.email" value="<s:property value="user.email"/>"
							onblur="check(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">余额</span> <label
							class="control-label" for="money"> </label> <input type="text"
							class="form-control input-lg" placeholder="余额" id="money"
							name="user.money" value="<s:property value="user.money"/>"
							onblur="check(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-7 col-xs-offset-1">
						<span class="label label-primary">积分</span> <label
							class="control-label" for="score"> </label> <input type="text"
							class="form-control input-lg" placeholder="积分" id="score"
							name="user.score" value="<s:property value="user.score"/>"
							onblur="check(this)">
					</div>
				</div>

				<div class="row">
					<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="修改"  id="updateUser">
						<b>修改</b>
					</button>
					<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="重置"  id="reset">
						<b>重置</b>
					</button>
				</div>
			</div>
			<div id="right">
				<div class="c">
					<label id="imglab" title="点击'+'号上传头像" class="loadfile"
						for="uploadfile"><img height="200px" width="200px" 
						src="<s:property value="user.avatar"/>" alt="+"></label><input type="file"
						id="uploadfile" style="display:none;" name="upload"/>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		function check(obj) {
			if ($(obj).val() == "") {
				layer.tips($(obj).attr('placeholder') + '不能为空', $(obj));
			}
		}

		$(document).ready(
				function() {
					$("#reset").click(function() {
						for (var i = 2; i < 6; i++) {
							$("input:eq(" + i + ")").val("");
						}
					});
					$("#updateUser").click(
							function() {
								for (var i = 2; i < 6; i++) {
									if ($("input:eq(" + i + ")").val() == "") {
										layer.tips($(obj).attr('placeholder')
												+ '不能为空', $(obj));
										return;
									}
								}
								layer.msg('修改成功');
								$('#updateUserform').submit();
							});
				});

		$(function() {
			$("#uploadfile")
					.on(
							"change",
							function(e) {
								var fr = new FileReader();
								fr.readAsDataURL(document
										.getElementById("uploadfile").files[0]);
								fr.onload = function(e) {
									$("#imglab").addClass("bg_size");
									$("#imglab").css("background-image",
											"url(" + e.target.result + ")");
									$("#imglab").html('');
								};
							});
		});
	</script>
</body>
</html>
