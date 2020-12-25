<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Payer</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicaid</div>
				<div class="panel-body">
					<div id="severity_payer_medicaid"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicare</div>
				<div class="panel-body">
					<div id="severity_payer_medicare"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other Payer</div>
				<div class="panel-body">
					<div id="severity_payer_other"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Private Health Insurance</div>
				<div class="panel-body">
					<div id="severity_payer_private"></div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicaid" />
	<jsp:param name="dom_element" value="#severity_payer_medicaid" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicare" />
	<jsp:param name="dom_element" value="#severity_payer_medicare" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Other Payer" />
	<jsp:param name="dom_element" value="#severity_payer_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Private Health Insurance" />
	<jsp:param name="dom_element" value="#severity_payer_private" />
</jsp:include>

