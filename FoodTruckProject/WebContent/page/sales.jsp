<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>매출관리</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/heroic-features.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>

<body>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1>매출 관리</h1>
            <p>푸드트럭의 매출을 월별, 주별로 관리해보세요!</p>
            <p>
            	<a data-toggle="modal" href="#registerModal" class="btn btn-primary">매출 등록하기</a>
            	<a data-toggle="modal" href="#updateModal" class="btn btn-primary">매출 수정하기</a>
            </p>
        </header>

        <hr>

        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>주별 매출</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row">
        	<div class="chart-horiz">
	        	<ul class="chart">
				  <li class="title" title="해당 주의 일요일부터 토요일까지의 통계이며, 단위는 원(\)입니다."></li>
				  <!-- <li class="current" title="Label 1"><span class="bar" data-number="38000"></span><span class="number">38,000</span></li> -->
				  <c:forEach items="${requestScope.weekList}" var="a">
					  <li class="past" title="${a.dateToString()}(${a.getMonthDate()})">
					  	<span class="bar" data-number="${a.salesValue}"></span>
					  	<span class="number">${a.salesValue}</span>
					  </li>
				  </c:forEach>
				</ul>
			</div>
        </div>
        <!-- /.row -->

        <hr>
        
        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>월별 매출</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row">
			<div id="chart_div"> </div>
        </div>
        <!-- /.row -->
        
        <!-- Page Features -->
        <div class="row">
			<c:forEach items="${requestScope.monthList}" var="a">
				<p>${a}</p>
			</c:forEach>
        </div>
        <!-- /.row -->
        
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
    
    <!-- 모달 -->
    <!-- 매출 등록 모달 -->
	<div id="registerModal" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-content">
            	<div class="modal-header">
            		매출 등록하기
            	</div>
            	<div class="modal-body">
                     <form action="./foodtruck?cmd=SalesRegister" method="post">
	                     <div class="form-body pal">
                            <div class="form-group">
							  <label class="control-label" for="inputDefault">오늘의 매출</label>
							  <input name="sale" type="text" class="form-control" id="inputDefault" placeholder="숫자만 입력해주세요.">
							</div>
	                     </div>
	                     <div class="form-actions text-right pal">
	                         <button type="submit" class="btn btn-primary">등록 완료</button>
	                         <button type="reset" class="btn btn-primary">등록 취소</button>
	                     </div>
                     </form>
                 </div>
             </div>
		</div><!-- modal-dialog -->
	</div><!-- registerModal -->
	
	<!-- 매출 수정 모달 -->
	<div id="updateModal" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-content">
            	<div class="modal-header">
            		매출 수정하기
            	</div>
            	<div class="modal-body">
                     <form action="./foodtruck?cmd=SalesUpdate" method="post">
	                     <div class="form-body pal">
                            <div class="form-group">
							  <label class="control-label" for="inputDefault">수정할 날짜</label>
							  <input name="date" type="date" class="form-control" id="inputDefault">
							</div>
							<div class="form-group">
							  <label class="control-label" for="inputDefault">수정 금액</label>
							  <input name="sale" type="text" class="form-control" id="inputDefault">
							</div>
	                     </div>
	                     <div class="form-actions text-right pal">
	                         <button type="submit" class="btn btn-primary">수정 완료</button>
	                         <button type="reset" class="btn btn-primary">수정 취소</button>
	                     </div>
                     </form>
                 </div>
             </div>
		</div><!-- modal-dialog -->
	</div><!-- updateModal -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery.horizBarChart.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <!-- 차트 -->
    <script>
    	$(document).ready(function(){
    		
	    	$('.chart').horizBarChart({
	    	  selector: '.bar',
	    	  speed: 3000
	    	});
	    	
    	});


    	// 월별차트
    	// Load the Visualization API and the piechart package.
	    google.load('visualization', '1', {'packages':['corechart']});
	      
	    // Set a callback to run when the Google Visualization API is loaded.
	    google.setOnLoadCallback(drawChart);
	      
	    function drawChart() {
	      var jsonData = $.ajax({
	          url: "./foodtruck?cmd=SalesAjax",
	          dataType:"json",
	          async: false
	      }).responseText;
	          
	      // Create our data table out of JSON data loaded from server.
	      var data = new google.visualization.DataTable(jsonData);
	
	      // Instantiate and draw our chart, passing in some options.
	      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      
	      chart.draw(data, {width: 1000, height: 300});
	    }
    	
    </script>
    
    
    
</body>

</html>
