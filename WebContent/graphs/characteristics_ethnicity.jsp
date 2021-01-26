<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Ethnicity</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as hispanic from enclave_cohort.all_patient_characteristics_by_covid_status where value='Hispanic or Latino') as hispanic
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as non from enclave_cohort.all_patient_characteristics_by_covid_status where value='Not Hispanic or Latino') as non
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as unknown from enclave_cohort.all_patient_characteristics_by_covid_status where value='Missing/Unknown' and variable='Ethnicity') as unknown
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Hispanic or Latino</div>
				<div class="panel-body">
					<div id="ethnicity_hispanic"></div>
				</div>
				<div class="panel-footer">Overall: ${row.hispanic}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Not Hispanic or Latino</div>
				<div class="panel-body">
					<div id="ethnicity_not"></div>
				</div>
				<div class="panel-footer">Overall: ${row.non}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="ethnicity_missing"></div>
				</div>
				<div class="panel-footer">Overall: ${row.unknown}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Ethnicity&value=Hispanic or Latino" />
	<jsp:param name="dom_element" value="#ethnicity_hispanic" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Ethnicity&value=Not+Hispanic or Latino" />
	<jsp:param name="dom_element" value="#ethnicity_not" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Ethnicity&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#ethnicity_missing" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

