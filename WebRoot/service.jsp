<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="djf"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>service</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	<meta name="description" content="Your description">
	<meta name="keywords" content="Your keywords">
	<meta name="author" content="Your name">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/touchTouch.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/kwicks-slider.css" type="text/css" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<script src="BootStrap3.0.3/js/jquery.min.js"></script>
	<script src="BootStrap3.0.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>    
	<script type="text/javascript" src="js/touchTouch.jquery.js"></script>
	
	<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

	<script>		
		 jQuery(window).load(function() {	
		 $x = $(window).width();		
	if($x > 1024)
	{			
	jQuery("#content .row").preloader();}	
		 
     jQuery('.magnifier').touchTouch();			
    jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});	
  		  }); 
				
	</script>

	<!--[if lt IE 8]>
  		<div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>  
 	<![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<!--<![endif]-->
	<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/docs.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
  <![endif]-->
  		<style type="text/css">
  			#mytop{
  			
  				background: black;
  				height: 50px;
  			}
  			body{
  				margin-top:50px;
  			}
  		</style>
  		
	</head>

	<body>
    <div class="spinner"></div> 
<!--============================== header =================================-->

<nav class="navbar navbar-inverse navbar-fixed-top" id="mytop">
<div class="container" id="top">
	<div class="row">
	<div class="span5">
	<s:if test="#session.user!=null">
    	<p class="navbar-text">画美人欢迎您,&nbsp;&nbsp;<a href="javascript:;" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
    	<s:property value="#session.user.name"/>  </a>&nbsp;&nbsp;<a href="relogin">退出登录</a>
    	
 	 	</p>	
 	</s:if>	
 	<s:else>
 	 	<p class="navbar-text">已有账号？请&nbsp;&nbsp;&nbsp;<a href="login.html" class="btn btn-danger">登录</a>&nbsp;&nbsp;还没有账号？点击：&nbsp;<a href="register.html" class="btn btn-danger">注册</a>

 	 	</p>
	</s:else>
	</div>	
	<div class="span6">
		
	</div>
	<div class="span1">
	
  		<a href="cart"><img alt="购物车" src="img/cart.png"  height="50px" width="50px" /></a>
	
	</div>
</div>
</div>
</nav>

<header>
      <div class="container clearfix">
    <div class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
            <h1 class="brand brand_"><a href="index.jsp"><img alt="" src="img/logo.gif"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            <div class="nav-collapse nav-collapse_  collapse">
                  <ul class="nav sf-menu">
                <li ><a href="index">首页</a></li>
                <li class="sub-menu active"><a href="Service">服务</a>
                      <ul>
	                    <s:iterator value="#application.typeList" var="type">
	                     	<li><a href='Service?typeid=<s:property value="#type.typeid"/>'><s:property value="#type.name"/></a></li>
	                     </s:iterator>
                  	</ul>
                </li>
               
                <li><a href="product.jsp">作品</a></li>
                <li><a href="showpainter">画师</a></li>
                <li><a href="contact.jsp">联系我们</a></li>
              </ul>
                </div>
          </div>
            </div>
      </div>
        </div>
  </div>
  
</header>
    
<div class="bg-content">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">We welcome you to join</h4>
      </div>
       <form class="form-inline" method="post" action="UpdateUser">
      <div class="modal-body">
     
      	<div style="margin:10 20;" class="text-center">
        	<img alt="头像" src="<s:property value="#session.user.avatar"/>" height="100px" width="100px" class="img-circle"/>
        	<button type="button" class="btn btn-primary pull-right">编辑资料</button>
        </div>
        <div>
        	<div class="form-group-lg">
			    <label for="name">用户名：</label>
			    <input type="text" class="form-control input-lg" id="name" name="uname" value="<s:property value="#session.user.name"/>">
			</div>
			<div class="form-group-lg">
				<label for="pwd">密码：</label>
			    <input type="password" class="form-control input-lg " id="pwd" name="pwd" value="<s:property value="#session.user.pwd"/>">
			</div>
			<div class="form-group-lg">
				<label for="date">注册日期：</label>
			    <input type="text" class="form-control input-lg " id="date" name="date" value="<s:property value="#session.user.regdate"/>">
			</div>
			<div style="margin:0 ">
				<h5>您的余额为：<s:property value="#session.user.money"/>&nbsp;&nbsp;&nbsp;&nbsp; 您的积分为：<s:property value="#session.user.score"/></h5>
				
			</div>
			<input type="hidden" name="id" value="<s:property value="#session.user.userid"/>"/>
        </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">确认修改</button>
      </div>
       </form>	
    </div>
    
  </div>
</div>

      
      <!--============================== content =================================-->
      
      <div id="content"><div class="ic">More Website Templates @ TemplateMonster.com. November19, 2012!</div>
    <div class="container">
          <div class="row">
        <article class="span12">
              <h3>Services</h3>
            </article>
        <div class="clear"></div>
        <ul class="thumbnails thumbnails-1 list-services">
        	<s:if test="#session.page==null">
        	<s:iterator value="#application.typeList" var="type">
              <li class="span4">
            <div class="thumbnail thumbnail-1"> <img  src="<s:property value="#type.coverimg"/>" alt="图片">
                  <section> <a href="Service?typeid=<s:property value="#type.typeid"/>" class="link-1"><s:property value="#type.name"/> </a>
                <p><s:property value="#type.description"/> </p>
              </section>
                </div>
         	 </li>
          </s:iterator>
         </s:if>
          <s:else>
          	<s:iterator value="#session.page.goodses" var="goods" status="status">
              <li class="span4">
           	 <div class="thumbnail thumbnail-1"> <img  src="<s:property value="#goods.img"/>" alt="">
                  <section> <a href="Goodsinfo?goods.goodsid=<s:property value="#goods.goodsid"/>" class="link-1"><s:property value="#goods.painter.name"/> </a>
                <p><s:property value="#goods.name"/></p>
                <p style="color:red;">价格:<s:property value="#goods.price"/></p>
              </section>
                </div>
         	 </li>
         	 </s:iterator>
          	 <div class="row">
          	 <div class="span5 offset7">
          	 <djf:page pageIndex="${sessionScope.page.pageIndex}" url="Service?typeid=${sessionScope.page.typeid}&" pageMax="${sessionScope.page.totalPage}"/></div></div>
          </s:else> 
            </ul>
      </div>
        </div>
  </div>
    </div>

<!--============================== footer =================================-->
<%@include file="footer.jsp" %>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>