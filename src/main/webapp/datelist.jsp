<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.List" import="yhPrj.dto.VO" %>
    
   
 <%
 	String dtCount = (String)request.getAttribute("dtCount"); //파일 전송 총 횟수를 받아오는 코드
	String dfCount = (String)request.getAttribute("dfCount"); //파일 전송 중 결과값(사기값) 받아오는 코드
	List<VO> dlist = (List<VO>)request.getAttribute("dlist"); //사용자 정보를 담은 리스트를 받아오는 코드
%> 
     
  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
 	<style>
 	
 		.date_table_box {
            width: 1000px;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
 		
 		}
 		.date_table_box th:first-child {
            float:right;
 			
 		}
 		.date_table_box th:last-child {
 			width:100px;
 		}



 		
 	
        .table_main {
            border: 1px #a39485 solid;
            font-size: .9em;
            box-shadow: 0 2px 5px rgba(0,0,0,.25);
            width: 1000px;
            border-collapse: collapse;
            border-radius: 5px;
            overflow: hidden;
        }

        th {
            text-align: left;
        }
        
        .table_main thead {
        	text-align: center;
            font-weight: bold;
            color: #fff;
            background: #73685d;
        }
        
        td, th {
            padding: 1em .5em;
            vertical-align: middle;
            text-align:center;
        }
        
        td {
            border-bottom: 1px solid rgba(0,0,0,.1);
            background: #fff;
        }


        input { margin: 10px;}

     

        html, body { height: 100%; }

        .wrap {
            flex-direction: column;
            height: 100%;
        }
        .header {
            height: 70px;
            background-color: bisque;
        }
        .tablist {
        	width: 100%;
            height: 400px;
            box-shadow: 0 2px 2px 0 rgba(0,0,0,0.1);
            border-bottom: 1px solid gainsboro;
            background-color: white;
        }
        .content {
            display: flex;
            flex: 1;
        }
        .aside {
         	flex-direction: row;
            flex: none;
            width: 300px;
            border-top: 1px solid gainsboro;
            border-right: 1px solid gainsboro;
        }
        .main {
        	display:flex;
           	width: 100%;
           	padding:50px;
        }
        #btn-upload {
            margin-top : 10px;
            
        }

        #mainTtitle {
            width:100%;
  
        }



        .main_content1 {
            height: 900px;
           
         
         }

        .main_content1 h2 {
            width: 200px;
        }
        
        h2 {
        	text-align: center;
        	padding-bottom: 50px;
        }
        
        
        /* ul li { display: inline-block; padding: 20px 50px;} */

        .list_save {
           	text-align: center;
        }
        .list_save div {
            width: 150px;
            height: 150px;
         	margin: 10px auto;
            border: 5px inset #aeb1b1;
            border-radius: 50%;
        }
        .list_save div p {
            
            line-height: 150px;
        }

        .main_content2 {
        	width: 100%;
        	margin: 0 auto;
        	
        }
        
        .main_content2 table { 
           margin: 0 auto;
           text-align: center;
        }
        
        
       /* 슬라이드 CSS  */
        img {width:100%; height:400px;}
		
		/* #imgslide { margin-top: 10px;} */
		
		.imgs {
		    position: relative;
		    overflow: hidden;
		    width: 1200px;
		    height:400px;
		    background-color: #white;
		    margin: 0 auto;
		}
		
		.imgs>img {
		    width:100%;
		    position: absolute;
		    transition: all 1s;
		}
		
		/* 페이징 버튼 */
		.asdie-selectDiv {
			postion: absoulte;
			margin-top : 200px;
			
		}
		.asdie-selectBox {
			width: 300px;
			height: 50px;
			text-align: center;
			font-size: 20px;
			font-style: bold;
			margin: 2px auto;
			background-color: #5a5a5a;
			color:white;
		}
		
		#table-pasing {
			margin-top:5px;
		}
		
		#table-pasing .pagination {
			justify-content: center;
		}
		
/* 도넛 차트 */
.wrap_donut {
  position: relative;
  padding: 2%;
}

.container_donut {
  display: inline-block;
  gap: 10px;
  margin-bottom: 10px;
}

.chart_donut {
  position: relative;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  transition: 0.3s;
  margin-bottom : 30px;
}

/* span.center_donut {
  background: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 40px;
  height: 40px;
   border-radius: 50%;
  text-align: center;
  line-height: 40px;
  font-size: 15px;
  transform: translate(-50%, -50%); /* 가운데 위 */ 
 */
/* button {
  width: 80px;
  position: absolute;
  left: 0;
  right: 0;
  margin: 0 auto;
}	 */
		 */
		
        
   
 body {
  font: 13px/20px "Lucida Grande", Tahoma, Verdana, sans-serif;
}

aside {
  position: relative;
}

.login {
 
  position: absolute;
  margin: 0 auto;
  width: 300px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}


.login h1 {
	height:30px;
	line-height:30px;
	font-size: 20px;
	text-align: center;
	text-shadow: 0 1px white;
	background: #f3f3f3;
	border-bottom: 1px solid #cfcfcf;
	border-radius: 3px 3px 0 0;
	background-image: -webkit-linear-gradient(top, whiteffd, #eef2f5);
	background-image: -moz-linear-gradient(top, whiteffd, #eef2f5);
	
	background-image: -o-linear-gradient(top, whiteffd, #eef2f5);
	background-image: linear-gradient(to bottom, whiteffd, #eef2f5);
	-webkit-box-shadow: 0 1px whitesmoke;
	box-shadow: 0 1px whitesmoke;
}

.login p {
  margin: 20px 0 0;
}



.login input[type=text], .login input[type=password] {
  width: 278px;
}


.login p.remember_me input {
  position: relative;
  bottom: 1px;
  margin-right: 4px;
  vertical-align: middle;
}

.login p.submit {
  text-align: right;
}

.login-help {
  margin: 20px 0;
  font-size: 11px;
  color: white;
  text-align: center;
  text-shadow: 0 1px #2a85a1;
}


:-moz-placeholder {
  color: #c9c9c9 !important;
  font-size: 13px;
}

::-webkit-input-placeholder {
  color: #ccc;
  font-size: 13px;
}

input {
  font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif;
  font-size: 14px;
}

input[type=text], input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

input[type=text]:focus, input[type=password]:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
}

input[type=submit] {
  padding: 0 18px;
  height: 29px;
  font-size: 12px;
  font-weight: bold;
  color: #527881;
  text-shadow: 0 1px #e3f1f1;
  background: #cde5ef;
  border: 1px solid;
  border-color: #b4ccce #b3c0c8 #9eb9c2;
  border-radius: 16px;
  outline: 0;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -moz-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -o-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: linear-gradient(to bottom, #edf5f8, #cde5ef);
  -webkit-box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
  box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
}

input[type=submit]:active {
  background: #cde5ef;
  border-color: #9eb9c2 #b3c0c8 #b4ccce;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
}

.lt-ie9 input[type=text], .lt-ie9 input[type=password] {
  line-height: 34px;
}


.box:hover {
  color:palevioletred;
}


/* header */
a {
  text-decoration: none;
}

li {
  list-style-type: none;
}

.hbody {
  background-color: #263544;
  width: 100%;
  height: 70px;
}

.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
 /*  padding: 20px 50px; */
  color: white;
  height: 70px;
}

.hbody .nav ul {
	display: flex;
	width: 1000px;
}
.hbody .nav ul li {
	margin: 0 auto;
	line-height:70px;
}

.title {
  font-size: 2em;
}

.title > a {
  color: white;
}	

/* nav */
#navbarScroll {
	justify-content: space-around;
}

.nav-item {
	padding-left: 150px;
}

#date_list_box {
	
}
#date_list {
float:right;
padding-right:150px;
}



</style>
 
    <title>Document</title>
  
</head>
<body>
  
    <div id="wrap" class="wrap">
    
        <header>
       <nav class="navbar navbar-expand-lg bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Voice phishing</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarScroll" >
		      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="page">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">phishing</a>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" aria-expanded="false">
		            Service center
		          </a>
		       
		        </li>
		        <li class="nav-item">
		          <a class="nav-link disabled">Link</a>
		        </li>
		      </ul>
		      <form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		      </form>
		    </div>
		  </div>
		</nav>

		</header>
		
		
        <div class="tablist">
        	<div class="imgs">
			  <img src="img/img3.jpg" alt="no">
			  <img src="img/img4.jpg" alt="no"> 
			  <img src="img/img3.jpg" alt="no">
			  <img src="img/img4.jpg" alt="no">
			</div>
			
			<!-- 슬라이드 코드  -->
		 	<script>
				var imgs = 3;
				var now = 0;
	
				function slide() {
				    now = now == imgs ? 0 : now += 1; 
	
				    $(".imgs>img").eq(now - 1).css({"margin-left": "-2000px"});
				    $(".imgs>img").eq(now).css({"margin-left": "0px"});
				}
	
				function start() {
				    $(".imgs>img").eq(0).siblings().css({"margin-left":"-2000px"});
				    
				    setInterval(function () { slide()}, 2000);
				}
				start();			
			</script>
        </div>
        <div class="content">

            <!-- aside logout -->
            <div class="aside">
            
            	<!--  로그인 -->
                <div class="login">
                    <h1>환영합니다.</h1>
                    <!-- logout form  -->
                    <form method="post" action="logout">
                      <p> admin 님 환영합니다.</p>
                      <p class="submit"><input type="submit" name="commit" value="logout"></p>
                    </form>
                 </div>
                 <!--  로그인 끝 -->
                 
                 <!--  asdie drop down -->
               	 <div class="asdie-selectDiv">
               	 	<select class="asdie-selectBox">
					  <option selected>멤버관리</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>옵션3</option>
					</select>
					<select class="asdie-selectBox">
					  <option selected>고객관리</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>옵션3</option>
					</select>
					<select class="asdie-selectBox">
					  <option selected>게시판</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>옵션3</option>
					</select>
					<select class="asdie-selectBox">
					  <option selected>프로모션</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>옵션3</option>
					</select>
					<select class="asdie-selectBox">
					  <option selected>앱스토어</option>
					  <option>옵션1</option>
					  <option>옵션2</option>
					  <option>옵션3</option>
					</select>
		     	 </div>
                 <!-- asdie drop down END -->
                 
                 
            </div>
         
            <div class="main">
                <div class="main_content1">
                    <h2>총 누적현황</h2>
                    
                    <div class='wrap_donut'>
					  <div class='container_donut'>
					  	<p>검사수</p>
					    <div class="chart_donut doughnut1"><span class="center_donut"><%=dtCount %>명</span></div>
					    <p>피싱 일치</p>
					    <div class="chart_donut doughnut2"><span class="center_donut"><%=dfCount %>명</span></div>
					    <p>피싱 불일치</p>
					    <div class="chart_donut doughnut3"><span class="center_donut"><%=Integer.parseInt(dtCount) - Integer.parseInt(dfCount) %>명</span></div>
					  </div>
					  <button onClick=replay()>
					    reset버튼
					  </button>
					</div>
					
					<script>
				    
					   	const chart1 = document.querySelector('.doughnut1');
					   	const chart2 = document.querySelector('.doughnut2');
					   	const chart3 = document.querySelector('.doughnut3');
					
					   	const makeChart = function(counting, classname, color) {
					   	  let i = 1;
					   	  // 반복호출
					   	  let chartFn = setInterval(function() {
					   	    if (i <= counting) {
					   	      colorFn(i, classname, color);
					   	      i++;
					   	    } else {
					   	    // 중단
					   	      clearInterval(chartFn);
					   	    }
					   	  }, 10);
					   	}
					
					   	const colorFn = function(i, classname, color) {
							// 색상 넣기
					   		classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
					   	}
						
					   	// 리셋 함수
					   	const replay = () => {
					   	  makeChart(<%=dtCount %>, chart1, '#f5b914');
					   	  makeChart(<%=dfCount %>, chart2, '#0A174E');
					   	  makeChart(<%=Integer.parseInt(dtCount) - Integer.parseInt(dfCount) %>, chart3, '#66d2ce');
					   	}
					
					   	makeChart(<%=dtCount %>, chart1, '#f5b914');
					   	makeChart(<%=dfCount %>, chart2, '#0A174E');
					   	makeChart(<%=Integer.parseInt(dtCount) - Integer.parseInt(dfCount) %>, chart3, '#66d2ce');
									
					</script>
					
                  <%--   <div class="list_save">
                    	<p>검사 수</p>
                        <div class="box">
                        
                            <p><%=tCount %>명</p>
                        </div>
                        <p>피싱 일치</p>
                        <div class="box">
                        	
                            <p><%=fCount %>명</p>
                        </div>
                        <p>피싱 불일치</p>
                        <div class="box">
                        	
                            <p><%=Integer.parseInt(tCount) - Integer.parseInt(fCount) %>명</p>
                        </div>        
                    </div> --%>
                </div>
                
                <div class="main_content2">
                    <div>
                        <h2>기간별 보이스 피싱 리스트</h2>
                    </div>
                     <!-- 날짜 표시 div 추가  -->
                     
                     <table class="date_table_box">
                           <thead>
                           <tr>
                            <th>	
                           
		                    	
		                    </th>    
		                    <th>
		                    	<a href="javascript:history.back()">
	                    			<input type="submit" value="전체보기"></input>
	                    		</a>  
		                    </th>       
                           </tr>
                           </thead>
                       </table>           
                   <!--  <div id="date_list_box">
	                    <form method="post" action="dlist">
		                    <input type="date" value="0000-00-00" name="fdate"> -
		                    <input type="date" value="0000-00-00" name="bdate">
		                    <input type="submit" value="조회">
	                    </form>
                    </div> -->

                    
                        <table class="table_main">
                            <thead>
                            <tr>
                            	<th>파일 번호</th>
                                <th>파일 소유자</th>
                                <th>파일 이름</th>
                                <th>파일 타입</th>
                                <th>파일 전송 시간</th>
                                <th>사기 여부 (1 : 사기, 0 : 정상)</th>                        
                            </tr>
                            </thead>
                            <tbody>
                             <%for(VO vo : dlist){ %>
						 		<tr>
						 			<td><%=vo.getFilenumber() %></td>
									<td><%=vo.getFileowner() %></td>
									<td><%=vo.getFilename()%></td>
									<td><%=vo.getFiletype() %></td>
									<td><%=vo.getFiletime() %></td>
									<td>
									<%if(vo.getResultCode().equals("1")){%>사기
									<%}else{%>정상<%} %>
									</td>
									
								</tr>
								<%} %> 
                            </tbody>
                        </table>
                        <div aria-label="Page navigation example" id="table-pasing">
						  <ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						  </ul>
						</div>
	                </div>
	            </div>
	        </div>
        </div>
      
</body>
</html>