<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
         <form action="work" method="get" id="searchForm" class="col-md-12" >
	          <div class="col-sm-12" >
	          	<ol class="breadcrumb float-sm-left">
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>작업관리</h1>
	          	</ol>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
			        	<form action="/manufacturingInstruction" method="get">
	              <div class="col-sm-1 ml-auto" style="margin-left: 10px;">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
	            	</div>
	            </ol>
	          </div><!-- /.col -->
	          <br>
          	<!-- 검색창 1줄 -->
             <div class="searchBar">
               <div class="col-sm-1 sb-name">거래처번호</div>
               <div class="col-sm-2 sb-text">
	               	<input type="text" list="workCompanyList" class="col-sm-12 input-text"  id="find_work_company" name="find_work_company">
	                <datalist id="workCompanyList">
                       <c:forEach items="${companyList}" var="company">
                           <option value="${company.companyId}">${company.companyName} (${company.companyDiv})</option>
                       </c:forEach>
	                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">제품번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workItemList" class="col-sm-12 input-text"  id="find_work_item" name="find_work_item">
	                <datalist id="workItemList">
                     <c:forEach items="${itemList}" var="item">
                         <option value="${item.itemId}">${item.itemName} (${item.itemUses})</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">조회일자</div>
               <div class="col-sm-4 sb-text" style="margin-left: 8px;">
                 <input type="date" class="col-sm-6 input-text"  id="workStartDate" name="workStartDate"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" style="margin-right: 4px;"/>
                   ~
                 <input type="date" class="col-sm-6 input-text"  id="workEndDate" name="workEndDate"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" style="margin-left: 4px;"/>
               </div>
             </div>
             <!-- 검색창 2줄 -->
             <div class="searchBar" style="margin-top: -12px;">
               <div class="col-sm-1 sb-name">제조<br>LOT번호</div>
	             <div class="col-sm-2 sb-text">
                 <input type="text" list="workInstructuionList" class="col-sm-12 input-text" id="find_work_instruction" name="find_work_instruction">
	                <datalist id="workInstructuionList">
                     <c:forEach items="${instructionList}" var="instruction">
                         <option value="${instruction.insLotId}">생산제품번호: ${instruction.insItemId}</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workProcessInfoList" class="col-sm-12 input-text" id="find_work_processInfo" name="find_work_processInfo">
	                <datalist id="workProcessInfoList">
                     <c:forEach items="${processInfoList}" var="processInfo">
                         <option value="${processInfo.pi_id}">공정명: ${processInfo.pi_name} | 설비명: ${processInfo.mi_name}(${processInfo.pi_machine_id}, 위치:${processInfo.position}) </option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">작업번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12 input-text" id="find_work_id" name="find_work_id"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
               </div>
             </div>
           </form>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
	        <!-- 제조수행정보 Table -->
	        <div class="titleAndTable" id="selectManufacturingPerformInfo" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">공정별 제조수행정보</div>
	            </div>
	          <div class="workTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>공정명</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>수주업체</th>
	                  <th>생산시작일</th>
	                  <th>생산종료일</th>
	                  <th>진행상황</th>
	                  <th>계획수량</th>
	                  <th>단위</th>
	                  <th>누적생산수량</th>
	                  <th>누적불량수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
		              <c:forEach items="${workProcessInfoList}" var="workProcessInfoList">
		                <tr>
		                  <td>${workProcessInfoList.rn}</td>
		                  <td>${workProcessInfoList.p_lot_id}</td>
		                  <td>${workProcessInfoList.p_pi_id}</td>
		                  <td>${workProcessInfoList.pi_name}</td>
		                  <td>${workProcessInfoList.p_b_item_id}</td>
		                  <td>${workProcessInfoList.i_name}</td>
		                  <td>${workProcessInfoList.c_name}</td>
		                  <td>${workProcessInfoList.p_start_date}</td>
		                  <td>${workProcessInfoList.p_end_date}</td>
		                  <td>${workProcessInfoList.p_status}</td>
		                  <td>${workProcessInfoList.p_plan_quantity}</td>
		                  <td>${workProcessInfoList.ct_unit}</td>
		                  <td>${workProcessInfoList.p_item_quantity}</td>
		                  <td>${workProcessInfoList.p_defective_quantity}</td>
		                </tr>
	                </c:forEach>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <br>
        <!-- 작업목록 Table -->
        <div class=divBorder></div>
        <!-- 당일작업등록 페이지 이동 버튼 -->
        <div class="col-sm-12 todayWorkInsertBtn" style="margin-top: -20px;">
           <button type="button" id="" class="btn btn-default search-btn" onclick="location.href='todayWorkInsert'">
            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
            당일작업등록
          </button>
        </div><!-- /.당일작업등록 버튼 -->
        <div class="titleAndTable" id="selectWorkTable">
           <div class="workTableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="workTableName">작업목록</div>
            </div>
          <div class="workTable">
            <table cellpadding="0" cellspacing="0" border="0">
              <thead class="work-tbl-header">
                <tr>
                  <th>No</th>
                  <th>제조LOT번호</th>
                  <th>작업번호</th>
                  <th>지시일자</th>
                  <th>작업팀</th>
                  <th>진행상황</th>
                  <th>공정위치</th>
                  <th>공정명</th>
                  <th>제품번호</th>
                  <th>제품명</th>
                  <th>규격</th>
                  <th>기준단위</th>
                  <th>소요시간(분)</th>
                  <th>설비명</th>
                  <th>계획수량</th>
                  <th>생산수량</th>
                </tr>
              </thead>
              <tbody class="work-tbl-content">
                <tr>
                  <td>1</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                </tr>
              </tbody>
            </table><!-- /.table -->
        </div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <div class=divBorder></div>
        <div class="workSelectBtn">
            <input type="button" class="workSelect" id="selectProductionBtn" value="생산실적"/>
            <input type="button" class="workSelect" id="selectMaterialInputBtn" value="자재투입내역"/>
            <input type="button" class="workSelect" id="selectWorkerBtn" value="작업자"/>
        </div>
        <div class=divBorder></div>
        <!-- 생산실적 Table -->
	        <div class="titleAndTable" id="selectProduction">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">생산실적</div>
	            </div>
	          <div class="workTable" id="selectProductionTable" style="max-height: 174px">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header" style="height: 48px;">
	                <tr>
                  <th>No</th>
                  <th>제조LOT번호</th>
                  <th>작업번호</th>
                  <th>지시일자</th>
                  <th>작업팀</th>
                  <th>작업자</th>
                  <th>진행상황</th>
                  <th>공정위치</th>
                  <th>공정명</th>
                  <th>제품번호</th>
                  <th>제품명</th>
                  <th>규격</th>
                  <th>기준단위</th>
                  <th>소요시간(분)</th>
                  <th>설비명</th>
                  <th>계획수량</th>
                  <th>생산수량</th>
                  <th>불량수량</th>
                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
                <tr>
                  <td>1111</td>
                  <td>300001</td>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>생산1팀</td>
                  <td>작업자들</td>
                  <td>생산대기</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>손잡이 경첩 보링기1호</td>
                  <td>1200</td>
                  <td>1230</td>
                  <td>20</td>
                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
					</div><!-- /.titleAndTable -->
	        <!-- 자재투입내역 Table -->
	        <div class="titleAndTable" id="selectMaterialInput">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">자재투입내역</div>
	            </div>
	          <div class="workTable" id="selectProductionTable" style="max-height: 174px">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>수주업체</th>
	                  <th>투입일자</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>투입수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>1</td>
	                  <td>300001</td>
	                  <td>3001</td>
	                  <td>10000001</td>
	                  <td>노트북트레이-A</td>
	                  <td>인테리어스케이프</td>
	                  <td>2024-04-08</td>
	                  <td>20000001</td>
	                  <td>플라스틱 테두리</td>
	                  <td>1000</td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
					</div><!-- /.titleAndTable -->
	        <!-- 작업자 Table -->
	        <div class="titleAndTable" id="selectWorker">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">작업자</div>
	            </div>
	          <div class="workTable" style="max-height: 174px">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>작업팀</th>
	                  <th>작업자명</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>공정위치</th>
	                  <th>작업시작시간</th>
	                  <th>작업종료시간</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>AAC</td>
	                  <td>생산1팀, 생산2팀</td>
	                  <td>작업자들작업자들작업자들</td>
	                  <td>300001</td>
	                  <td>3001</td>
	                  <td>1-1</td>
	                  <td>2024-04-08 11:09:08</td>
	                  <td>2024-04-08 20:09:08</td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
					</div><!-- /.titleAndTable -->
					
					
      	</div><!-- /.row -->
    	</div><!-- /.container-fluid -->
  	</div><!-- /.content -->
  </div><!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
  <script type="text/javascript">
		//검색창
		function search() {
	    // 검색 로직 실행
			document.getElementById('searchForm').submit();
		}
		
		
  </script>
  <script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
