<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Miscellaneous Measures</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Average Age at Visit Start</div>
				<div class="panel-body">
					<div id="misc_age"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Test  Count</div>
				<div class="panel-body">
					<div id="misc_test"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">BMI</div>
				<div class="panel-body">
					<div id="misc_bmi"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Weight</div>
				<div class="panel-body">
					<div id="misc_weight"></div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#misc_age" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Testcount" />
	<jsp:param name="dom_element" value="#misc_test" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=BMI" />
	<jsp:param name="dom_element" value="#misc_bmi" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Weight" />
	<jsp:param name="dom_element" value="#misc_weight" />
</jsp:include>
