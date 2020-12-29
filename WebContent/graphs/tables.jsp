<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="target_table"></div>

<script type="text/javascript">
	function render(mode) {
		d3.html("tables/" + mode + ".jsp", function(fragment) {
			var divContainer = document.getElementById("target_table");
			divContainer.innerHTML = "";
			divContainer.append(fragment);
		});
	}
</script>

<form action="index.jsp">
	<label for="table">Choose a table:</label> <select name="mode" id="mode" onchange="render(mode.value)">
		<option value="characteristics"	<c:if test="${empty param.mode ||  param.mode == 'characteristics' }">selected</c:if>>Characteristics</option>
		<option value="blood" <c:if test="${param.mode == 'blood' }">selected</c:if>>Blood</option>
		<option value="charlson" <c:if test="${param.mode == 'charlson' }">selected</c:if>>Charlson</option>
		<option value="filled" <c:if test="${param.mode == 'filled' }">selected</c:if>>Filled</option>
		<option value="meds" <c:if test="${param.mode == 'meds' }">selected</c:if>>Medications</option>
		<option value="models" <c:if test="${param.mode == 'models' }">selected</c:if>>Models</option>
		<option value="peak" <c:if test="${param.mode == 'peak' }">selected</c:if>>Peaks</option>
		<option value="severity" <c:if test="${param.mode == 'severity' }">selected</c:if>>Severity</option>
	</select>
</form>

<jsp:include page="../tables/characteristics.jsp" flush="true" />

<div id="table" style="overflow: scroll;">&nbsp;</div>
<div id="op_table" style="overflow: scroll;">&nbsp;</div>
