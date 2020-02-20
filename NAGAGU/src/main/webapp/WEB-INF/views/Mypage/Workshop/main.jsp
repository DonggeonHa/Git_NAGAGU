<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
%>

<!-- 작업 구역 -->
<div id="page-content-wrapper" style="padding-top: 2%;">
	<div class="container-fluid">
	<!-- 
   	Counts Section
      <section class="dashboard-counts section-padding">
        <div class="container-fluid-1">
          <div class="row">
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-user"></i></div>
                <div class="name"><strong class="text-uppercase">New Clients</strong><span>Last 7 days</span>
                  <div class="count-number">25</div>
                </div>
              </div>
            </div>
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-padnote"></i></div>
                <div class="name"><strong class="text-uppercase">Work Orders</strong><span>Last 5 days</span>
                  <div class="count-number">400</div>
                </div>
              </div>
            </div>
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-check"></i></div>
                <div class="name"><strong class="text-uppercase">New Quotes</strong><span>Last 2 months</span>
                  <div class="count-number">342</div>
                </div>
              </div>
            </div>
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-bill"></i></div>
                <div class="name"><strong class="text-uppercase">New Invoices</strong><span>Last 2 days</span>
                  <div class="count-number">123</div>
                </div>
              </div>
            </div>
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-list"></i></div>
                <div class="name"><strong class="text-uppercase">Open Cases</strong><span>Last 3 months</span>
                  <div class="count-number">92</div>
                </div>
              </div>
            </div>
            Count item widget
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-list-1"></i></div>
                <div class="name"><strong class="text-uppercase">New Cases</strong><span>Last 7 days</span>
                  <div class="count-number">70</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      Header Section
      <section class="dashboard-header section-padding">
        <div class="container-fluid-1">
          <div class="row d-flex align-items-md-stretch">
            To Do List
            <div class="col-lg-3 col-md-6">
              <div class="card to-do" style="height: 100%;">
                <h2 class="display h4">To do List</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <div id="canvas-holder" style="width:100%; height: 100%;">
					<canvas id="chart-area" style="width:100%; height: 100%;"></canvas>
				</div>
              </div>
            </div>
            Pie Chart
            <div class="col-lg-3 col-md-6">
              <div class="card project-progress">
                <h2 class="display h4">Project Beta progress</h2>
                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <div class="pie-chart">
                  <canvas id="pieChart" width="300" height="300"> </canvas>
                </div>
              </div>
            </div>
            Line Chart
            <div class="col-lg-6 col-md-12 flex-lg-last flex-md-first align-self-baseline">
              <div class="card sales-report">
                <h2 class="display h4">Sales marketing report</h2>
                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor amet officiis</p>
                <div class="line-chart">
                  <canvas id="lineCahrt"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section> -->
      <!-- Statistics Section-->
      <!-- <section class="statistics">
        <div class="container-fluid-1">
          <div class="row d-flex">
            <div class="col-lg-4">
              Income
              <div class="card income text-center">
                <div class="icon"><i class="icon-line-chart"></i></div>
                <div class="number">126,418</div><strong class="text-primary">All Income</strong>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do.</p>
              </div>
            </div>
            <div class="col-lg-4">
              Monthly Usage
              <div class="card data-usage">
                <h2 class="display h4">Monthly Usage</h2>
                <div class="row d-flex align-items-center">
                  <div class="col-sm-6">
                    <div id="progress-circle" class="d-flex align-items-center justify-content-center"></div>
                  </div>
                  <div class="col-sm-6"><strong class="text-primary">80.56 Gb</strong><small>Current Plan</small><span>100 Gb Monthly</span></div>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              </div>
            </div>
            <div class="col-lg-4">
              User Actibity
              <div class="card user-activity">
                <h2 class="display h4">User Activity</h2>
                <div class="number">210</div>
                <h3 class="h4 display">Social Users</h3>
                <div class="progress">
                  <div role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar bg-primary"></div>
                </div>
                <div class="page-statistics d-flex justify-content-between">
                  <div class="page-statistics-left"><span>Pages Visits</span><strong>230</strong></div>
                  <div class="page-statistics-right"><span>New Visits</span><strong>73.4%</strong></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section> -->
    </div>
</div>
<!-- chart.js api -->
<script src="${pageContext.request.contextPath}/resources/js/Admin/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Admin/utils.js"></script>
<style>
canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
.dashboard-counts {
    color: #333;
    background: #f8f9fa;
}
.section-padding {
    padding: 3rem 0;
}
.container-fluid-1 {
    width: 100%;
    margin-right: auto;
    margin-left: auto;
}
.dashboard-counts .count-title i {
    font-size: 1.5em;
    color: #1b1b27;
}
.dashboard-counts strong {
    font-size: 0.9em;
    font-weight: 500;
    color: #555;
    display: block;
}
.dashboard-counts .count-title span {
    font-size: 0.8em;
    color: #aaa;
    display: block;
}
.dashboard-counts .count-number {
    font-size: 3.2em;
    font-weight: 300;
}
.statistics .income .icon {
    font-size: 3.5em;
}
</style>
<script>
</script>
<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/css/fontastic.css">