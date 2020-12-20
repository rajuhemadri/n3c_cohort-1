<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp" flush="true" />

<style type="text/css" media="all">
	@import "resources/n3c_login_style.css";
</style>
<style type="text/css">table.dataTable thead .sorting_asc{
		background-image:none !important;
	}
</style>

<body>

	<jsp:include page="navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Cohort Characterisation</h2>
    	<div style="text-align:center;">
        </div>
<p>&nbsp;</p>
<form action="index.jsp">
<label for="table">Choose a table:</label>
<select name="mode" id="mode"  onchange="this.form.submit()">
  <option value="blood" <c:if test="${param.mode == 'blood' }">selected</c:if>>Blood</option>
  <option value="characteristics" <c:if test="${empty param.mode ||  param.mode == 'characteristics' }">selected</c:if>>Characteristics</option>
  <option value="charlson" <c:if test="${param.mode == 'charlson' }">selected</c:if>>Charlson</option>
  <option value="filled" <c:if test="${param.mode == 'filled' }">selected</c:if>>Filled</option>
  <option value="meds" <c:if test="${param.mode == 'meds' }">selected</c:if>>Medications</option>
  <option value="models" <c:if test="${param.mode == 'models' }">selected</c:if>>Models</option>
  <option value="peak" <c:if test="${param.mode == 'peak' }">selected</c:if>>Peaks</option>
  <option value="severity" <c:if test="${param.mode == 'severity' }">selected</c:if>>Severity</option>
</select>
</form>
<c:choose>
	<c:when test="${param.mode == 'blood' }">
		<h3>Blood Type</h3>
		<jsp:include  page="tables/blood.jsp" flush="true"/>
	</c:when>
	<c:when test="${empty param.mode || param.mode == 'characteristics' }">
		<h3>Patient Characteristics by COVID Status</h3>
		<jsp:include  page="tables/characteristics.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'charlson' }">
		<h3>Charlson Frequency </h3>
		<jsp:include  page="tables/charlson.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'filled' }">
		<h3>Filled CC  Tag</h3>
		<jsp:include  page="tables/filled.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'meds' }">
		<h3>Medication Use Frequency</h3>
		<jsp:include  page="tables/meds.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'models' }">
		<h3>Models and Summary</h3>
		<jsp:include  page="tables/models.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'peak' }">
		<h3>Peak, Average and Nadir</h3>
		<jsp:include  page="tables/peak.jsp" flush="true"/>
	</c:when>
	<c:when test="${param.mode == 'severity' }">
		<h3>Severity</h3>
		<jsp:include  page="tables/severity.jsp" flush="true"/>
	</c:when>
</c:choose>
<div id="table" style="overflow: scroll;">&nbsp;</div>

<div id="op_table" style="overflow: scroll;">&nbsp;</div>
	<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
