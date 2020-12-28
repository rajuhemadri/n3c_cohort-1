<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Miscellaneous Measures</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as bmi from enclave_cohort.all_patient_characteristics_by_covid_status where variable='BMI') as bmi
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as testcount from enclave_cohort.all_patient_characteristics_by_covid_status where variable='Testcount') as testcount
	on true
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as weight from enclave_cohort.all_patient_characteristics_by_covid_status where variable='Weight') as weight
	on true
	left join
	(select to_char(substring(x__all from '[0-9.]+')::float, '999,999,999.99') as age from enclave_cohort.all_patient_characteristics_by_covid_status where variable='age_at_visit_start_in_years_int') as age
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Average Age at Visit Start</div>
				<div class="panel-body">
					<div id="char_misc_age"></div>
				</div>
				<div class="panel-footer">Overall: ${row.age}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Test  Count</div>
				<div class="panel-body">
					<div id="char_misc_test"></div>
				</div>
				<div class="panel-footer">Overall: ${row.testcount}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">BMI</div>
				<div class="panel-body">
					<div id="char_misc_bmi"></div>
				</div>
				<div class="panel-footer">Overall: ${row.bmi}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Weight</div>
				<div class="panel-body">
					<div id="char_misc_weight"></div>
				</div>
				<div class="panel-footer">Overall: ${row.weight}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=age_at_visit_start_in_years_int" />
	<jsp:param name="dom_element" value="#char_misc_age" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Testcount" />
	<jsp:param name="dom_element" value="#char_misc_test" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=BMI" />
	<jsp:param name="dom_element" value="#char_misc_bmi" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Weight" />
	<jsp:param name="dom_element" value="#char_misc_weight" />
</jsp:include>
