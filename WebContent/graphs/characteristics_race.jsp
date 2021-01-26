<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Race</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as asian from enclave_cohort.all_patient_characteristics_by_covid_status where value='Asian') as asian
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as black from enclave_cohort.all_patient_characteristics_by_covid_status where value='Black or African American') as black
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as unknown from enclave_cohort.all_patient_characteristics_by_covid_status where value='Missing/Unknown' and variable='Race') as unknown
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as hawaiian from enclave_cohort.all_patient_characteristics_by_covid_status where value='Native Hawaiian or Other Pacific Islander') as hawaiian
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.all_patient_characteristics_by_covid_status where value='Other' and variable='Race') as other
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as white from enclave_cohort.all_patient_characteristics_by_covid_status where value='White') as white
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Asian</div>
				<div class="panel-body">
					<div id="race_asian"></div>
				</div>
				<div class="panel-footer">Overall: ${row.asian}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Black or African American</div>
				<div class="panel-body">
					<div id="race_black"></div>
				</div>
				<div class="panel-footer">Overall: ${row.black}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="race_missing"></div>
				</div>
				<div class="panel-footer">Overall: ${row.unknown}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Native Hawaiian or Other Pacific Islander</div>
				<div class="panel-body">
					<div id="race_hawaiian"></div>
				</div>
				<div class="panel-footer">Overall: ${row.hawaiian}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="race_other"></div>
				</div>
				<div class="panel-footer">Overall: ${row.other}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">White</div>
				<div class="panel-body">
					<div id="race_white"></div>
				</div>
				<div class="panel-footer">Overall: ${row.white}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Asian" />
	<jsp:param name="dom_element" value="#race_asian" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Black+or+African+American" />
	<jsp:param name="dom_element" value="#race_black" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#race_missing" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Native+Hawaiian+or+Other+Pacific+Islander" />
	<jsp:param name="dom_element" value="#race_hawaiian" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Other" />
	<jsp:param name="dom_element" value="#race_other" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#race_white" />
	<jsp:param name="html" value="percentage" />
</jsp:include>
