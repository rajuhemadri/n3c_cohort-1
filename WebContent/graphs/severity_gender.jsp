<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Gender</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Female</div>
				<div class="panel-body">
					<div id="severity_gender_female"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Male</div>
				<div class="panel-body">
					<div id="severity_gender_male"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="severity_gender_other"></div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=FEMALE" />
	<jsp:param name="dom_element" value="#severity_gender_female" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=MALE" />
	<jsp:param name="dom_element" value="#severity_gender_male" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=Other" />
	<jsp:param name="dom_element" value="#severity_gender_other" />
</jsp:include>

