<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Miscellaneous Measures</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as bmi from enclave_cohort.severity_table2_for_export where variable='BMI') as bmi
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as stay from enclave_cohort.severity_table2_for_export where variable='length_of_stay') as stay
	on true
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as weight from enclave_cohort.severity_table2_for_export where variable='Weight') as weight
	on true
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as age from enclave_cohort.severity_table2_for_export where variable='age_at_visit_start_in_years_int') as age
	on true
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,990.99') as qscore from enclave_cohort.severity_table2_for_export where variable='Q_Score') as qscore
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Average Age at Visit Start</div>
				<div class="panel-body">
					<div id="severity_misc_age"></div>
					<p>Overall: ${row.age}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Length of Stay</div>
				<div class="panel-body">
					<div id="severity_misc_stay"></div>
					<p>Overall: ${row.stay}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">BMI</div>
				<div class="panel-body">
					<div id="severity_misc_bmi"></div>
					<p>Overall: ${row.bmi}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Weight</div>
				<div class="panel-body">
					<div id="severity_misc_weight"></div>
					<p>Overall: ${row.weight}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Q Score</div>
				<div class="panel-body">
					<div id="severity_misc_q"></div>
					<p>Overall: ${row.qscore}</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#severity_misc_age" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=length_of_stay" />
	<jsp:param name="dom_element" value="#severity_misc_stay" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=BMI" />
	<jsp:param name="dom_element" value="#severity_misc_bmi" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Weight" />
	<jsp:param name="dom_element" value="#severity_misc_weight" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Q_Score" />
	<jsp:param name="dom_element" value="#severity_misc_q" />
</jsp:include>
