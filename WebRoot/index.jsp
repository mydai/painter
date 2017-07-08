<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>index</title>
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
	<script type="text/javascript" src="js/jquery.js"></script>
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
	jQuery("#content .row").preloader();    }	
		 
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
		<audio autoplay="autoplay" controls="controls" loop="loop" style="clear:both;margin:10 0;"
            src="audio/樱花樱花想见你.mp3" ></audio>
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
                <li class="active"><a href="index">首页</a></li>
                <li class="sub-menu"><a href="Service">服务</a>
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
			    <input type="text" class="form-control input-lg" id="name" name="user.name" value="<s:property value="#session.user.name"/>">
			</div>
			<div class="form-group-lg">
				<label for="pwd">密码：</label>
			    <input type="password" class="form-control input-lg " id="pwd" name="user.pwd" value="<s:property value="#session.user.pwd"/>">
			</div>
			<div class="form-group-lg">
				<label for="date">注册日期：</label>
			    <input type="text" class="form-control input-lg " id="date" name="user.regdate" value="<s:property value="#session.user.regdate"/>">
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
      <div class="container">
    <div class="row">
          <div class="span12"> 
        <!--============================== slider =================================-->
        <div class="flexslider">
              <ul class="slides">
            <li> <img src="img/slide-1.jpg" alt="" > </li>
            <li> <img src="img/slide-2.jpg" alt="" > </li>
            <li> <img src="img/slide-3.jpg" alt="" > </li>
            <li> <img src="img/slide-4.jpg" alt="" > </li>
            <li> <img src="img/slide-5.jpg" alt="" > </li>
          </ul>
            </div>
        <span id="responsiveFlag"></span>
        <div class="block-slogan">
              <h2>Welcome!</h2>
              <div>
            <p><a href="service.jsp" target="_blank" class="link-1">点击查看服务</a> 画美人网创建于2016年9月1日，宗旨是为爱美爱手绘的人群提供更方便的网上购画服务！目前我们提供的手绘服务有6种风格迥异的转手绘，分别为：唯美风，暗黑风，炫彩风，言情风，油画风，梦幻风。当然我们后期会提供更多的服务，欢迎您来采购！！！</p>
          </div>
            </div>
      </div>
        </div>
  </div>
      
      <!--============================== content =================================-->
      
      <div id="content" class="content-extra"><div class="ic">More Website Templates @ TemplateMonster.com. November19, 2012!</div>
    <div class="row-1">
          <div class="container">
        <div class="row">
              <ul class="thumbnails thumbnails-1">
            <li class="span3">
                  <div class="thumbnail thumbnail-1">
                <h3>艺术总监</h3>
                <img  src="img/page1-img1.jpg" alt="">
                <section> <strong>朱明瑶</strong>
                      <p>公司创始人之一，现担任艺术总监职位</p>
                      <a href="javascript:;" class="btn btn-1">Read More</a> </section>
              </div>
                </li>
            <li class="span3">
                  <div class="thumbnail thumbnail-1">
                <h3>销售总监</h3>
                <img  src="img/page1-img2.jpg" alt="">
                <section> <strong>刘硕</strong>
                      <p>公司创始人之一，现担任销售总监职位</p>
                      <a href="javascript:;" class="btn btn-1">Read More</a> </section>
              </div>
                </li>
            <li class="span3">
                  <div class="thumbnail thumbnail-1">
                <h3>财务总监</h3>
                <img  src="img/page1-img4.jpg" alt="">
                <section> <strong>丁鹏</strong>
                      <p>公司创始人之一，现担任财务总监</p>
                      <a href="javascript:;" class="btn btn-1">Read More</a> </section>
              </div>
                </li>
            <li class="span3">
                  <div class="thumbnail thumbnail-1">
                <h3 class="title-1 extra">执行总监</h3>
                <img  src="img/page1-img3.jpg" alt="">
                <section> <strong>崔志翔</strong>
                      <p>公司创始人之一，现担任执行总监</p>
                      <a href="javascript:;" class="btn btn-1">Read More</a> </section>
              </div>
                </li>
          </ul>
            </div>
      </div>
        </div>
    <div class="container">
          <div class="row">
        <article class="span6">
              <h3>公司创始人简介</h3>
              <div class="wrapper">
            <figure class="img-indent"><img src="img/page1-img5.jpg " alt="" /></figure>
            <div class="inner-1 overflow extra">
                  <div class="txt-1">我们建立这个网站的初衷是：  1.为了给画师们一个更好的就业平台；  2.给爱美爱手绘的人们一个更方便的购画平台。</div>
                  	如果您有什么好的建议或者您想来我们公司应聘，请在我们的联系我们界面里填写信息。我们会认真对待每一份给我们发来的邮件，并尽快给您答复！
                  <div class="border-horiz"></div>
                  <div class="overflow">
                <ul class="list list-pad">
                      <li><a href="javascript:;">姓名：</a></li>
                      <li><a href="javascript:;">年龄：</a></li>
                      <li><a href="javascript:;">QQ：</a></li>
                      <li><a href="javascript:;">微信：</a></li>
                    </ul>
                <ul class="list">
                      <li><a href="javascript:;">刘凯</a></li>
                      <li><a href="javascript:;">22</a></li>
                      <li><a href="javascript:;">823612762</a></li>
                      <li><a href="javascript:;">15705596491</a></li>
                    </ul>
              </div>
                </div>
          </div>
            </article>
        <article class="span6">
              <h3>公司近期作品</h3>
              <ul class="list-photo">
            <li><a href="img/page3-imglg1.jpg" class="magnifier" ><img src="img/page1-img6.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg2.jpg" class="magnifier" ><img src="img/page1-img7.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg3.jpg" class="magnifier" ><img src="img/page1-img8.jpg " alt="" /></a></li>
            <li class="last"><a href="img/page3-imglg4.jpg" class="magnifier" ><img src="img/page1-img9.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg5.jpg" class="magnifier" ><img src="img/page1-img10.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg6.jpg" class="magnifier" ><img src="img/page1-img11.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg7.jpg" class="magnifier" ><img src="img/page1-img12.jpg " alt="" /></a></li>
            <li class="last"><a href="img/page3-imglg8.jpg" class="magnifier" ><img src="img/page1-img13.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg9.jpg" class="magnifier" ><img src="img/page1-img14.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg10.jpg" class="magnifier" ><img src="img/page1-img15.jpg " alt="" /></a></li>
            <li><a href="img/page3-imglg11.jpg" class="magnifier" ><img src="img/page1-img16.jpg " alt="" /></a></li>
            <li class="last"><a href="img/page3-imglg12.jpg" class="magnifier" ><img src="img/page1-img17.jpg " alt="" /></a></li>
          </ul>
            </article>
      </div>
        </div>
  </div>
    </div>

<!--============================== footer =================================-->
<%@include file="footer.jsp" %>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>