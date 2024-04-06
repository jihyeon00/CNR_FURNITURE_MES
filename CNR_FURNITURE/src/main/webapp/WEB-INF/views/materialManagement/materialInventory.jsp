<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- jQuery 연결 -->
<script defer src="/resources/js/materialMNG.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>자재재고조회</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary search-btn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
        </div><!-- /.row -->
        <!-- 검색 키워드 영역 -->
        <div class="row matInventory-search-row">
        	<!-- 검색창 -->
          <div class="col-sm-12 matInventory-searchBar">
          	<!-- 자재번호 -->
            <div class="col-sm-1 matInventory-search-title">자재번호</div>
            <div class="col-sm-2 matInventory-search-content">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>자재번호 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div><!-- /.자재번호 -->
            <!-- 출고일자 -->
            <div class="col-sm-1 matInventory-search-title">출고일자</div>
            <div class="col-sm-2 matOInventory-search-content">
            	<input type="date" class="col-sm-12" id="" name=""/>
            </div><!-- /.출고일자 -->
            <!-- 제조LOT번호 -->
            <div class="matInventory-search-title matInventory-LOT-ID">제조LOT번호</div>
            <div class="form-select matInventory-search-content matInventory-LOT-ID">
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>제조LOT번호 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div>
          </div>
				</div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
					<div class="matInventory-titleAndTable">
						<div class="matInventory-title">
							<i class="fa fa-list"></i>
							<span>자재출고현황</span>
						</div>
						<!-- 자재테이블 -->
						<div class="col-sm-9">
							<div class="matInventory-table">
								<table cellpadding="0" cellspacing="0" border="0">
									<thead class="matInventory-table-header">
										<tr>
											<th>No</th>
											<th>제조LOT번호</th>
											<th>자재번호</th>
											<th>자재명</th>
											<th>출고일자</th>
											<th>출고단위</th>
											<th>출고수량</th>
										</tr>
									</thead>
									<tbody class="matInventory-table-content">
										<tr>
											<td>1열</td>
											<td>2열</td>
											<td>3열</td>
											<td>4열</td>
											<td>5열</td>
											<td>6열</td>
											<td>7열</td>
										</tr>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
						</div>
						<!-- /.col-sm-9 -->
					</div>
					<!-- /.titleAndTable -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>


