<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Ethnicity</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Hispanic or Latino</div>
				<div class="panel-body">
					<div id="severity_ethnicity_hispanic"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Not Hispanic or Latino</div>
				<div class="panel-body">
					<div id="severity_ethnicity_not"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="severity_ethnicity_missing"></div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Ethnicity&value=Hispanic or Latino" />
	<jsp:param name="dom_element" value="#severity_ethnicity_hispanic" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Ethnicity&value=Not+Hispanic or Latino" />
	<jsp:param name="dom_element" value="#severity_ethnicity_not" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Ethnicity&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#severity_ethnicity_missing" />
</jsp:include>

