<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Gender</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as female from enclave_cohort.severity_table2_for_export where value='FEMALE') as female
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as male from enclave_cohort.severity_table2_for_export where value='MALE') as mail
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.severity_table2_for_export where value='Other' and variable='gender_concept_name') as other
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Female</div>
				<div class="panel-body">
					<div id="severity_gender_female"></div>
				</div>
				<div class="panel-footer">Total: ${row.female}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Male</div>
				<div class="panel-body">
					<div id="severity_gender_male"></div>
				</div>
				<div class="panel-footer">Total: ${row.female}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="severity_gender_other"></div>
				</div>
				<div class="panel-footer">Total: ${row.other}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=FEMALE" />
	<jsp:param name="dom_element" value="#severity_gender_female" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=MALE" />
	<jsp:param name="dom_element" value="#severity_gender_male" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=gender_concept_name&value=Other" />
	<jsp:param name="dom_element" value="#severity_gender_other" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

