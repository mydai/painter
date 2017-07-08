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

<title>My JSP 'addPainter.jsp' starting page</title>

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

#addPainters {
	margin-top: 2%;
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
	<form action="painter_addPainter" enctype="multipart/form-data"
		method="post" id="addPainterform">
		<div class="" id="addPainters">
			<div id="left" class="container-fluid">
				<div class="row">
					<h1 class="col-xs-4 col-sm-4 col-xs-offset-1">
						<b>画师添加</b>
					</h1>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">用户名</span> <label
							class="control-label" for="name"> </label><input type="text"
							class="form-control input-lg" placeholder="请输入用户名" id="name"
							name="painter.name" onblur="checkName(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">密码</span> <label
							class="control-label" for="pwd"> </label> <input type="text"
							class="form-control input-lg" placeholder="请输入密码" id="pwd"
							name="painter.pwd" value="" onblur="checkPwd(this)">
					</div>
				</div>
				<div class="row">
					<div class="form-group has-feedback col-xs-8 col-xs-offset-1">
						<span class="label label-primary">介绍</span> <label
							class="control-label" for="intro"> </label>
						<textarea rows="10" cols="63" id="intro" name="painter.intro"
							onblur="checkIntro(this)" placeholder="请输入介绍">
							<s:property value="#painter.intro" />
						</textarea>
					</div>
				</div>

				<div class="row">
					<button class="btn btn-primary btn-lg col-xs-2 col-xs-offset-2"
						type="button" value="addPainter" id="addPainter">
						<b>添加</b>
					</button>
					<button class="btn btn-default btn-lg col-xs-2 col-xs-offset-1"
						type="button" value="Reset" id="reset">
						<b>重置</b>
					</button>
				</div>
			</div>
			<div id="right">
				<div class="c">
					<label id="imglab" title="点击'+'号上传头像" class="loadfile"
						for="uploadfile">+</label><input type="file" id="uploadfile"
						style="display:none;" name="uploadCondition.upload" />
				</div>
			</div>
		</div>
	</form>
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
					$.post("painter_checkName", {
						"painter.name" : name.val()
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
				layer.tips($(obj).prev().prev().html() + "不可为空", pwd);
				return;
			}
			if (!reg.test(pwd.val())) {
				layer.tips("密码格式不正确，至少6位！", pwd);
				return;
			}
		}

		function checkIntro(obj) {
			var intro = $(obj);
			if ("" == intro.val().trim()) {
				layer.tips($(obj).prev().prev().html() + "不可为空", intro);
				return;
			}
		}

		$(document)
				.ready(
						function() {
							$("#reset").click(function() {
								$("input").val("");
								return;
							});
							$("#addPainter")
									.click(
											function() {
												for (var i = 1; i < 4; i++) {
													if (i == 0) {
														if ($(
																"input:eq(" + i
																		+ ")")
																.val().trim() == "") {
															layer
																	.tips(
																			$(
																					"input:eq("
																							+ i
																							+ ")")
																					.attr(
																							"placeholder")
																					+ "不能为空!",
																			$("input:eq("
																					+ i
																					+ ")"));
															return;
														}

														var name = $("#name");
														var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,}$/;
														if (!reg.test(name
																.val())) {
															layer
																	.tips(
																			"用户名格式不正确，至少6位！",
																			name);
															return;
														} else {
															$
																	.post(
																			"painter_checkName",
																			{
																				"painter.name" : name
																						.val()
																			},
																			function(
																					data) {
																				layer
																						.tips(
																								data,
																								name);
																			});
														}
													}

												}
												if (i == 1) {
													if ($("input:eq(" + i + ")")
															.val().trim() == "") {
														layer
																.tips(
																		$(
																				"input:eq("
																						+ i
																						+ ")")
																				.attr(
																						"placeholder")
																				+ "不能为空!",
																		$("input:eq("
																				+ i
																				+ ")"));
														return;
													}
													var reg = /^\w{6,}$/;
													var v = $(
															"input:eq(" + i
																	+ ")")
															.val();
													if (!reg.test(v)) {
														layer
																.tips(
																		"密码格式不正确，至少6位！",
																		"#pwd");
														return;
													}
												} else if (i == 2) {
													if ($("input:eq(" + i + ")")
															.val().trim() == "") {
														layer
																.tips(
																		$(
																				"input:eq("
																						+ i
																						+ ")")
																				.attr(
																						"placeholder")
																				+ "不能为空!",
																		$("input:eq("
																				+ i
																				+ ")"));
														return;
													}
												}
												layer.msg('添加成功');
												$('#addPainterform').submit();
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