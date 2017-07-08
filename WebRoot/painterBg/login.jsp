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

<title>My JSP 'login.jsp' starting page</title>

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
#login {
	margin-top: 140px;
}

body {
	background-color: #F8F8FF;
}
</style>
</head>

<body>
	<div class="container row" id="login">
		<h1 class="col-xs-4 col-md-offset-6">画师登陆</h1>
		<br> <br> <br> <br>
		<div class="input-group col-xs-4 col-md-offset-5">
			<span class="input-group-addon"><b>账号</b></span> <input type="text"
				class="form-control input-lg" placeholder="请输入账号" id="name"
				name="painter.name" onblur="check(this)">
		</div>
		<br>
		<div class="input-group col-xs-4 col-md-offset-5">
			<span class="input-group-addon"><b>密码</b></span> <input
				type="password" class="form-control input-lg" placeholder="请输入密码"
				id="pwd" name="painter.pwd" onblur="check(this)">
		</div>
		<br>
		<div class="input-group col-xs-5 col-md-offset-5">
			<div class="input-group col-xs-6" style="float:left;">
				<span class="input-group-addon"><b>验证码</b></span><input type="text"
					name="yzm" id="yzm" class="form-control input-lg"
					onblur="checkyzm()" placeholder="请输入验证码" />
			</div>
			<div style="margin: 10px 10px;float:left;" id="yzm">
				<img src="image.jsp" title="点击刷新"
					onclick="src='image.jsp?'+Math.random()"><b>点击刷新图片</b>
			</div>
		</div>
		<br />
		<button class="btn btn-primary btn-lg col-xs-1 col-md-offset-5"
			type="button" value="Login" onclick="login()">
			<b>登录</b>
		</button>
		<button class="btn btn-default btn-lg col-xs-1 col-md-offset-2"
			type="button" value="Reset" onclick="reset()">
			<b>重置</b>
		</button>
	</div>

	<script type="text/javascript" src="admin_bootstrap/js/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="admin_bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		document.onkeydown = keyListener;
		function keyListener(e) {
			if (e.keyCode == 13) {
				login();
			}
		}
		function login() {
			for (var i = 0; i < 3; i++) {
				if ($("input:eq(" + i + ")").val().trim() == "") {
					layer.tips($("input:eq(" + i + ")").attr("placeholder")
							+ "不能为空!", $("input:eq(" + i + ")"));
					return;
				}
			}
			var name = $("#name").val();
			var pwd = $("#pwd").val();
			var yzm = $("#yzm").val();
			var jsonStr = {
				"painter.name" : name,
				"painter.pwd" : pwd,
				"yzm" : yzm
			};
			$.getJSON("painter_painterlogin", jsonStr, function(result) {
				if (result.tips == "登录成功" && result.flag == true) {
					layer.msg(result.tips);
					setInterval("location.href = 'goodstype_showgoodstype'",
							500);
				} else {
					layer.msg(result.tips);
				}
			});
		}

		function check(obj) {
			if ("" == $(obj).val()) {
				layer.tips($(obj).prev().children().html() + "不能为空", $(obj));
			}
		}

		function checkyzm() {
			var yzm = $("#yzm").val();
			if (yzm == "") {
				layer.tips("验证码不能为空", "#yzm");
			} else {
				$.post("tlogin", {
					"yzm" : yzm
				}, function(data) {
					layer.tips(data, "#yzm");
				});
				var jsonStr = {
					"yzm" : yzm
				};
				$.getJSON("admin_checkyzm", jsonStr, function(result) {
					if (result.flag) {
						layer.tips("验证码输入正确！", "#yzm");
					} else {
						layer.tips("验证码输入错误！", "#yzm");
					}
				});
			}
		}

		function reset() {
			$("#name").val("");
			$("#pwd").val("");
		}
	</script>
</body>
</html>
