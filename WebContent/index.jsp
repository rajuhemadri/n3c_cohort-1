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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script><body>

	<jsp:include page="navbar.jsp" flush="true" />
	
	<div class="container center-box shadow-border">
    	<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Cohort Exploration</h2>
    	<div style="text-align:center;">
    	This is an initial configuration of an exploration tool for the N3C cohort data.<br>
    	Visualizations coming <i>real soon now...</i><br><br>
    	You are encouraged to submit suggestions for enhancements/additions to <a href="https://n3c-help.atlassian.net/jira/software/c/projects/N3CINTA/issues/N3CINTA-4">this tracking issue.</a>
        </div>
<p>&nbsp;</p>
<ul class="nav nav-tabs" style="font-size:16px;">
	<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
	<li><a data-toggle="tab" href="#blood">Blood</a></li>
	<li><a data-toggle="tab" href="#characteristics">Characteristics</a></li>
	<li><a data-toggle="tab" href="#charlson">Charlson</a></li>
	<li><a data-toggle="tab" href="#filled">Filled</a></li>
	<li><a data-toggle="tab" href="#medications">Medications</a></li>
	<li><a data-toggle="tab" href="#models">Models</a></li>
	<li><a data-toggle="tab" href="#peaks">Peaks</a></li>
	<li><a data-toggle="tab" href="#severity">Severity</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="home">
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
</div>

<div class="tab-pane fade" id="blood">
	<jsp:include page="graphs/blood.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="characteristics">
		<h3>Patient Characteristics by COVID Status</h3>
</div>
<div class="tab-pane fade" id="charlson">
	<jsp:include page="graphs/charlson.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="filled">
		<h3>Filled CC  Tag</h3>
</div>
<div class="tab-pane fade" id="medications">
		<h3>Medication Use Frequency</h3>
</div>
<div class="tab-pane fade" id="models">
		<h3>Models and Summary</h3>
</div>
<div class="tab-pane fade" id="peaks">
		<h3>Peak, Average and Nadir</h3>
</div>
<div class="tab-pane fade" id="severity">
		<h3>Severity</h3>
</div>
</div>
	<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html>
