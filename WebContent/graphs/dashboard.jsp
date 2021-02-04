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


.panel-primary .panel-heading{
	background-color: white;
	border: none;
    text-align: center;
}

.geo .panel-heading,
.stats .panel-heading,
.comor .panel-heading{
    font-size: 25px;
    color: #376076;
    font-weight: normal;
}

.age_sex .panel-heading,
.race_ethnicity .panel-heading{
    font-size: 18px;
    color: #333;
    font-weight: strong;
}

.panel-primary {
    border-color: lightgray;
/*     margin: 10px; */
}

.first_heading{
	text-align:center;
	font-size: 25px;
	font-weight: normal; 
	color: #376076;
}

.bar.left {
  fill: #3d6495;
}
.bar.right {
  fill: #bd2442;
}

.bar{
	fill-opacity: 1;
}

.age_sex .grid .tick line{
	stroke:lightgray;
}

.age_sex .grid .domain{
	stroke: white !important;
}


@media (min-width: 768px) and (max-width: 946px){
	#geographic_legend svg > g{
		transform: scale(0.7);
	}
}

.table-hover tbody tr:hover td, 
.table-hover tbody tr:hover th {
  border-top: 2px solid black !important;
  border-bottom: 2px solid black !important;
}

#overall_stats strong{
	color:#376076;
}
</style>


<div class="row stats">
	<div class="col-xs-12 ">
		<div class=" panel-primary">
			<div class="panel-heading">N3C Data Enclave Statistics</div>
			<div class="panel-body">
				<div id="overall_stats">
					<jsp:include page="../graph_support/n3c_fact_sheet.jsp" flush="true" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row geo">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">Geographic Distribution of N3C Cohort</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-md-3">
						<div id="geographic_legend"></div>
					</div>
					<div class="col-xs-12 col-md-9">
						<div id="geographic"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<h3 class="first_heading">Age and Sex Distributions of N3C Cohort</h3>

<div class="row row-no-gutters age_sex">
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Lab-confirmed Negative</div>
			<div class="panel-body">
				<div id="demographic-negative"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Lab-confirmed Positive</div>
			<div class="panel-body">
				<div id="demographic-positive"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">No COVID Test</div>
			<div class="panel-body">
				<div id="demographic-none"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Suspected COVID</div>
			<div class="panel-body">
				<div id="demographic-suspected"></div>
			</div>
		</div>
	</div>
</div>

<h3 class="first_heading">Race and Ethnicity Distributions of N3C Cohort (ethnicity-aggregated data for now!)</h3>

<div class="row row-no-gutters race_ethnicity">
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Lab-confirmed Negative</div>
			<div class="panel-body">
				<div id="race-negative"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Lab-confirmed Positive</div>
			<div class="panel-body">
				<div id="race-positive"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">No COVID Test</div>
			<div class="panel-body">
				<div id="race-none"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-heading">Suspected COVID</div>
			<div class="panel-body">
				<div id="race-suspected"></div>
			</div>
		</div>
	</div>
</div>

<div class="row comor">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">Comorbidity Distribution of COVID+ in N3C Cohort</div>
			<div class="panel-body">
				<jsp:include page="../tables/datatableC.html"/>
				 <script type="text/javascript" charset="utf8" src="tables/jquery.hottie.js"></script>
				 <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
				 <script type="text/javascript" charset="utf8" src="tables/jquery.hottie.js"></script>
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

<jsp:include page="../graph_support/cohort_map_legend.jsp">
	<jsp:param name="data_page" value="graph_support/map_data.jsp" />
	<jsp:param name="state_page" value="graph_support/us_states.jsp" />
	<jsp:param name="dom_element" value="#geographic_legend" />
</jsp:include>



<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/count_by_age.jsp?status=lab_confirmed_negative" />
	<jsp:param name="dom_element" value="#demographic-negative" />
	<jsp:param name="left_header" value="Male" />
	<jsp:param name="right_header" value="Female" />
	<jsp:param name="left_label" value="# of persons" />
	<jsp:param name="middle_label" value="Age" />
	<jsp:param name="right_label" value="# of persons" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/count_by_age.jsp?status=lab_confirmed_positive" />
	<jsp:param name="dom_element" value="#demographic-positive" />
	<jsp:param name="left_header" value="Male" />
	<jsp:param name="right_header" value="Female" />
	<jsp:param name="left_label" value="# of persons" />
	<jsp:param name="middle_label" value="Age" />
	<jsp:param name="right_label" value="# of persons" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/count_by_age.jsp?status=no_covid_test" />
	<jsp:param name="dom_element" value="#demographic-none" />
	<jsp:param name="left_header" value="Male" />
	<jsp:param name="right_header" value="Female" />
	<jsp:param name="left_label" value="# of persons" />
	<jsp:param name="middle_label" value="Age" />
	<jsp:param name="right_label" value="# of persons" />
</jsp:include>

<jsp:include page="../graph_support/pyramid.jsp">
	<jsp:param name="data_page" value="feeds/count_by_age.jsp?status=suspected_COVID" />
	<jsp:param name="dom_element" value="#demographic-suspected" />
	<jsp:param name="left_header" value="Male" />
	<jsp:param name="right_header" value="Female" />
	<jsp:param name="left_label" value="# of persons" />
	<jsp:param name="middle_label" value="Age" />
	<jsp:param name="right_label" value="# of persons" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/severity_temp.jsp?severity=lab_confirmed_negative" />
	<jsp:param name="dom_element" value="#race-negative" />
	<jsp:param name="grid_label_height" value="0" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/severity_temp.jsp?severity=lab_confirmed_positive" />
	<jsp:param name="dom_element" value="#race-positive" />
	<jsp:param name="grid_label_height" value="0" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/severity_temp.jsp?severity=no_covid_test" />
	<jsp:param name="dom_element" value="#race-none" />
	<jsp:param name="grid_label_height" value="0" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart_v4.jsp">
	<jsp:param name="data_page"	value="feeds/severity_temp.jsp?severity=suspected_covid" />
	<jsp:param name="dom_element" value="#race-suspected" />
	<jsp:param name="grid_label_height" value="0" />
</jsp:include>
