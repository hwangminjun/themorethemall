<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="card">
            <div class="card-body">
              <h5 class="card-title">Bordered Tabs Justified</h5>

              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" id="section_tab" data-bs-toggle="tab" data-bs-target="#section_content" type="button" role="tab" aria-controls="section" aria-selected="true">구역별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="store_tab" data-bs-toggle="tab" data-bs-target="#store_content" type="button" role="tab" aria-controls="store" aria-selected="false">점포별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="compare-tab" data-bs-toggle="tab" data-bs-target="#compare_content" type="button" role="tab" aria-controls="compare" aria-selected="false">매출 비교</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="special-tab" data-bs-toggle="tab" data-bs-target="#special_content" type="button" role="tab" aria-controls="special" aria-selected="false">특이사항 관리</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade show active" id="section_content" role="tabpanel" aria-labelledby="section_tab">
					<div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Line Chart</h5>

              <!-- Line Chart -->
              <canvas id="lineChart" style="max-height: 400px;"></canvas>
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#lineChart'), {
                    type: 'line',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                        label: 'Line Chart',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              </script>
              <!-- End Line CHart -->

            </div>
          </div>
        </div>
                </div>
                <div class="tab-pane fade" id="store_content" role="tabpanel" aria-labelledby="store_tab">
					탭2
                </div>
                <div class="tab-pane fade" id="compare_content" role="tabpanel" aria-labelledby="compare-tab">
					탭3
                </div>
                <div class="tab-pane fade" id="special_content" role="tabpanel" aria-labelledby="special-tab">
					탭4
                </div>
              </div><!-- End Bordered Tabs Justified -->

            </div>
          </div>
</body>
<script>
$('#section_tab').click(function(){
	
});
</script>
</html>