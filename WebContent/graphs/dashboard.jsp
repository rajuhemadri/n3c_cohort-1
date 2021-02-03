<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style> /* set the CSS */

/* svg { */
/*   border: 1px solid #ccc; */
/* } */

.axis line,
.axis path {
  shape-rendering: crispEdges;
  fill: transparent;
  stroke: #555;
}
.axis text {
  font-size: 11px;
}


.bar {
  fill-opacity: 0.75;
}
.bar.left {
  fill: steelblue;
}
.bar.right {
  fill: firebrick;
}
</style>

<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-primary">
			<div class="panel-heading">Geographic Distribution of N3C Cohort</div>
			<div class="panel-body">
				<div id="geographic"></div>
			</div>
		</div>
	</div>
</div>

<h3>Age and Sex Distributions of N3C Cohort (dummy data for now!)</h3>

<div class="row row-no-gutters">
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Lab-confirmed Negative</div>
			<div class="panel-body">
				<div id="demographic-negative"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Lab-confirmed Positive</div>
			<div class="panel-body">
				<div id="demographic-positive"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">No COVID Test</div>
			<div class="panel-body">
				<div id="demographic-none"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Suspected COVID</div>
			<div class="panel-body">
				<div id="demographic-suspected"></div>
			</div>
		</div>
	</div>
</div>

<h3>Race and Ethnicity Distributions of N3C Cohort (dummy data for now!)</h3>

<div class="row row-no-gutters">
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Lab-confirmed Negative</div>
			<div class="panel-body">
				<div id="race-negative"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Lab-confirmed Positive</div>
			<div class="panel-body">
				<div id="race-positive"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">No COVID Test</div>
			<div class="panel-body">
				<div id="race-none"></div>
			</div>
		</div>
	</div>
	<div class="col-sm-3">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">Suspected COVID</div>
			<div class="panel-body">
				<div id="race-suspected"></div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-primary">
			<div class="panel-heading">Comorbidity Distribution of COVID+ in N3C Cohort</div>
			<div class="panel-body">
				<jsp:include page="../tables/datatableC.html"/>
				<script>init();</script>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../graph_support/cohort_map.jsp">
	<jsp:param name="data_page" value="graph_support/map_data.jsp" />
	<jsp:param name="state_page" value="graph_support/us_states.jsp" />
	<jsp:param name="dom_element" value="#geographic" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/total_by_source_count_weekly_int.jsp" />
	<jsp:param name="dom_element" value="#demographic-negative" />
	<jsp:param name="left_header" value="bioRxiv" />
	<jsp:param name="right_header" value="medRxiv" />
	<jsp:param name="left_label" value="# of preprints" />
	<jsp:param name="middle_label" value="Week" />
	<jsp:param name="right_label" value="# of preprints" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/total_by_source_count_weekly_int.jsp" />
	<jsp:param name="dom_element" value="#demographic-positive" />
	<jsp:param name="left_header" value="bioRxiv" />
	<jsp:param name="right_header" value="medRxiv" />
	<jsp:param name="left_label" value="# of preprints" />
	<jsp:param name="middle_label" value="Week" />
	<jsp:param name="right_label" value="# of preprints" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/total_by_source_count_weekly_int.jsp" />
	<jsp:param name="dom_element" value="#demographic-none" />
	<jsp:param name="left_header" value="bioRxiv" />
	<jsp:param name="right_header" value="medRxiv" />
	<jsp:param name="left_label" value="# of preprints" />
	<jsp:param name="middle_label" value="Week" />
	<jsp:param name="right_label" value="# of preprints" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/total_by_source_count_weekly_int.jsp" />
	<jsp:param name="dom_element" value="#demographic-suspected" />
	<jsp:param name="left_header" value="bioRxiv" />
	<jsp:param name="right_header" value="medRxiv" />
	<jsp:param name="left_label" value="# of preprints" />
	<jsp:param name="middle_label" value="Week" />
	<jsp:param name="right_label" value="# of preprints" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#race-negative" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#race-positive" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#race-none" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#race-suspected" />
</jsp:include>
