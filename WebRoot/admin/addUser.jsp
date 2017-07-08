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

<title>My JSP 'addUser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="admin_bootstrap/css/bootstrap.min.css" />
<style type="text/css">
body {
	
}

#addUsers {
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

	<div class="" id="addUsers">
		<form action="user_addUser" enctype="multipart/form-data"
			method="post" id="addUserform">
			<!-- 		    <form action="user_addUser" method="post" id="oneform"> -->
			<div id="left" class="container-fluid">
				<div class="row">
					<h1 class="col-xs-4 col-sm-4 col-xs-offset-1">
						<b>用户添加</b>
					</h1>
				</div>

				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">用户名</span><input type="text"
							class="form-control input-lg" placeholder="用户名" id="name"
							name="user.name" onblur="checkName(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">密码</span> <input type="password"
							class="form-control input-lg" placeholder="密码" id="pwd"
							name="user.pwd" value="" onblur="checkPwd(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">确认密码</span><input
							type="password" class="form-control input-lg" placeholder="确认密码"
							id="repwd" value="" onblur="checkRepwd(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">邮箱</span><input type="text"
							class="form-control input-lg" placeholder="邮箱" id="email"
							name="user.email" value="" onblur="checkEmail(this)">
					</div>
				</div>
				<div class="row">
					<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-2"
						type="button" value="添加" id="addUser">
						<b>添加</b>
					</button>
					<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="重置" id="reset">
						<b>重置</b>
					</button>

				</div>
			</div>
			<div id="right">
				<div class="c">
					<label id="imglab" title="点击'+'号上传头像" class="loadfile"
						for="uploadfile">+</label><input type="file" id="uploadfile"
						style="display:none;" name="upload" />
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		function checkName(obj) {
			var name = $(obj);
			if ("" == name.val().trim()) {
				layer.tips("用户名不能为空", name);
				return;
			} else {
				var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,}$/;
				if (!reg.test(name.val())) {
					layer.tips("用户名格式不正确，至少6位！", name);
					return;
				} else {
					$.post("checkName", {
						"user.name" : name.val()
					}, function(data) {
						layer.tips(data, name);
					});
				}
			}
		}

		function checkPwd(obj) {
			var pwd = $(obj);
			var reg = /^\w{6,}$/;
			if ("" == pwd.val().trim()) {
				layer.tips($(obj).prev().html() + "不可为空", pwd);
				return;
			}
			if (!reg.test(pwd.val())) {
				layer.tips("密码格式不正确，至少6位！", pwd);
				return;
			}
		}

		function checkRepwd(obj) {
			var pwd = $('#pwd');
			var repwd = $(obj);
			if ("" == repwd.val().trim()) {
				layer.tips(repwd.prev().html() + "不可为空", repwd);
				return;
			}
			if (pwd.val() != repwd.val()) {
				layer.tips("两次密码输入不一致", repwd);
				return;
			}
		}

		function checkEmail(obj) {
			var email = $(obj);
			if ("" == email.val().trim()) {
				layer.tips("邮箱不能为空", email);
				return;
			}

			var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			;
			if (!reg.test(email.val())) {
				layer.tips("邮箱格式不正确", email);
				return;
			}

		}

		function checkIsRight() {
			for (var i = 1; i < 4; i++) {
				if (i == 1) {
					if ($("input:eq(" + i + ")").val().trim() == "") {
						layer.tips($("input:eq(" + i + ")").attr("placeholder")
								+ "不能为空!", $("input:eq(" + i + ")"));
						return;
					}
					var reg = /^\w{6,}$/;
					var v = $("input:eq(" + i + ")").val();
					if (!reg.test(v)) {
						layer.tips("密码格式不正确，至少6位！", "#pwd");
						return;
					}
				} else if (i == 2) {
					if ($("input:eq(" + i + ")").val().trim() == "") {
						layer.tips($("input:eq(" + i + ")").attr("placeholder")
								+ "不能为空!", $("input:eq(" + i + ")"));
						return;
					}
					var v1 = $("input:eq(" + (i - 1) + ")").val();
					var v2 = $("input:eq(" + i + ")").val();
					if (v1 != v2) {
						layer.tips("两次密码输入不一致！", "#repwd");
						return;
					}
				} else if (i == 3) {
					if ($("input:eq(" + i + ")").val().trim() == "") {
						layer.tips($("input:eq(" + i + ")").attr("placeholder")
								+ "不能为空!", $("input:eq(" + i + ")"));
						return;
					}
					var reg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
					var v = $("input:eq(" + i + ")").val();
					if (!reg.test(v)) {
						layer.tips("邮箱格式错误！", "#email");
						return;
					}
				}
			}
		}

		$(document).ready(function() {
			$("#reset").click(function() {
				$("input").val("");
			});
			$("#addUser").click(function() {
				var name = $("#name").val();
				if (name == "") {
					layer.tips("用户名不能为空", "#name");
					return;
				}
				checkIsRight();
				layer.msg('添加成功');
				$('#addUserform').submit();
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
