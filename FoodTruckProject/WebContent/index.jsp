<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Good Morning Food Truck</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

	<!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- 구글 맵 -->
	<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
	    #myModal {
	    	margin-left: auto;
	    	margin-right: auto;
	    	text-align: center;
	    }
	    
	    .modal-content {
	    	width: 50%;
	    }
    </style>

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
   <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"> Good Morning Food Truck </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                    <%
                    	String login = "";
            	
                    	if(session.getAttribute("customerNum")!=null) {
                    		login = (String) session.getAttribute("id")+"고객님";
                    	} else if(session.getAttribute("ownerNum")!=null) {
                    		login = (String) session.getAttribute("id")+"업주님";
                    	} else {
                    		login ="로그인";
                    	}
                    %>
                        <a class="page-scroll" href="./page/login.jsp" data-target="#myModal" data-toggle="modal"><%=login %></a>
                    </li>
                    <%
                    	String register = "";
                    	if(!login.equals("로그인")) {
                    		register = "로그아웃";
                    %>
                    <li>
                        <a class="page-scroll" href="./page/logout.jsp" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    </li>
                    
                    <%
                    	} else {
                    		register = "회원가입";
                    %>
                    <li>
                        <a class="page-scroll" href="./page/register.jsp" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    </li>
                    <%
                    	}
                    %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
    

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">굿모닝 푸드트럭에 오신 것을 환영합니다!</div>
                <div class="intro-heading">Good Morning<br/> Food Truck! </div>
                <a href="#services" class="page-scroll btn btn-xl"> 푸드트럭 등록하러 가기</a>
            </div>
        </div>
    </header>

    <!-- Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
        
        	<!-- 검색 div -->
            <div class="row">
                <div class="col-lg-12 text-center">
                <a href="./page/12.html" class="page-scroll btn btn-xl"> 전체 푸드트럭 보러가기  </a><br/><br/>
                    <h2 class="section-heading">검색을 통해 푸드트럭을 찾아보세요! </h2>
                    <div class="form-group">
					  <div class="input-group">
					    <input type="text" class="form-control">
					    <span class="input-group-btn">
				    		<button class="btn btn-default" type="button">Button</button>
					    </span><br/>
					  </div>
					</div> 
                </div>
            </div>
            
            <!-- 근처 푸드트럭 & 리뷰순 -->
            <div class="row">
            	<h2 id="demo" class="section-heading"></h2>
            	<div class="text-center" id="mapholder"></div>
	            <h1>가까운 거리 순</h1>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="./page/13.html" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/roundicons.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Round Icons</h4>
                        <p class="text-muted">Graphic Design</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="./page/13.html" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/startup-framework.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Startup Framework</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
	                    <a href="./page/13.html" class="portfolio-link" >
	                        <div class="portfolio-hover">
	                            <div class="portfolio-hover-content">
	                                <i class="fa fa-plus fa-3x"></i>
	                            </div>
	                        </div>
	                        <img src="img/portfolio/treehouse.png" class="img-responsive" alt="">
	                    </a>
	                    <div class="portfolio-caption">
	                        <h4>Treehouse</h4>
	                        <p class="text-muted">Website Design</p>
	                    </div>
	                </div>
	            <h2>좋아요, 리뷰가 많은 순</h2>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="./page/13.html" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/golden.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Golden</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="./page/13.html" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/escape.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Escape</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="./page/13.html" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/dreams.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Dreams</h4>
                        <p class="text-muted">Website Design</p>
                    </div>
                </div>
            </div>
        
        </div>
    </section>
  
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2014</span>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>
    
    <!-- 위치 정보 받아오기 --> 
	<script>
	var x = document.getElementById("demo");
	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition, showError);
	    } else { 
	        x.innerHTML = "해당 브라우저에서는 위치 정보를 이용하실 수 없습니다..";
	    }
	}
	
	function showPosition(position) {
	    lat = position.coords.latitude;
	    lon = position.coords.longitude;
	    
	    latlon = new google.maps.LatLng(lat, lon);
	    mapholder = document.getElementById('mapholder');
	    mapholder.style.height = '250px';
	    mapholder.style.width = '100%';
	    mapholder.style.marginBottom = '5em';
		
	    var myOptions = {
	    center:latlon,zoom:14,
	    mapTypeId:google.maps.MapTypeId.ROADMAP,
	    mapTypeControl:false,
	    navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
	    }
	    
	    x.innerHTML = "<small>고객님의 현재 위치 정보입니다 : 경도: " + lat + " 위도: " + lon + "</small>"; 
	    var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
	    var marker = new google.maps.Marker({position:latlon,map:map,title:"현재 위치입니다!"});
	}
	
	function showError(error) {
	    switch(error.code) {
	        case error.PERMISSION_DENIED:
	            x.innerHTML = "위치 정보를 받아오는 것을 거부했습니다."
	            break;
	        case error.POSITION_UNAVAILABLE:
	            x.innerHTML = "위치 정보를 이용할 수 없습니다."
	            break;
	        case error.TIMEOUT:
	            x.innerHTML = "위치 정보를 받아오는 시간을 초과했습니다."
	            break;
	        case error.UNKNOWN_ERROR:
	            x.innerHTML = "알 수 없는 에러입니다."
	            break;
	    }
	}
	
	
	$(document).ready(function() {
		getLocation();
	});
	
	</script>

</body>

</html>
