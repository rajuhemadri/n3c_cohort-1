<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Smoking Status</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Current or Former</div>
				<div class="panel-body">
					<div id="severity_smoking_current"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Non Smoker</div>
				<div class="panel-body">
					<div id="severity_smoking_non"></div>
				</div>
			</div>
		</div>
	</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=smoking_status&value=Current or Former" />
	<jsp:param name="dom_element" value="#severity_smoking_current" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=smoking_status&value=Non smoker" />
	<jsp:param name="dom_element" value="#severity_smoking_non" />
</jsp:include>
