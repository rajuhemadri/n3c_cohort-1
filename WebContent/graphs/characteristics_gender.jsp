<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Gender</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as female from enclave_cohort.all_patient_characteristics_by_covid_status where value='FEMALE') as female
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as male from enclave_cohort.all_patient_characteristics_by_covid_status where value='MALE') as mail
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.all_patient_characteristics_by_covid_status where value='Other' and variable='gender_concept_name') as other
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Female</div>
				<div class="panel-body">
					<div id="gender_female"></div>
				</div>
				<div class="panel-footer">Overall: ${row.female}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Male</div>
				<div class="panel-body">
					<div id="gender_male"></div>
				</div>
				<div class="panel-footer">Overall: ${row.male}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="gender_other"></div>
				</div>
				<div class="panel-footer">Overall: ${row.other}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=gender_concept_name&value=FEMALE" />
	<jsp:param name="dom_element" value="#gender_female" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=gender_concept_name&value=MALE" />
	<jsp:param name="dom_element" value="#gender_male" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=gender_concept_name&value=Other" />
	<jsp:param name="dom_element" value="#gender_other" />
</jsp:include>

