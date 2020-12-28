<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Payer</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as medicaid from enclave_cohort.all_patient_characteristics_by_covid_status where value='Medicaid') as medicaid
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as medicare from enclave_cohort.all_patient_characteristics_by_covid_status where value='Medicare') as medicare
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.all_patient_characteristics_by_covid_status where value='Other Payer') as other
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as priv from enclave_cohort.all_patient_characteristics_by_covid_status where value='Private Health Insurance') as private
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicaid</div>
				<div class="panel-body">
					<div id="payer_medicaid"></div>
				</div>
				<div class="panel-footer">Overall: ${row.medicaid}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicare</div>
				<div class="panel-body">
					<div id="payer_medicare"></div>
				</div>
				<div class="panel-footer">Overall: ${row.medicare}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other Payer</div>
				<div class="panel-body">
					<div id="payer_other"></div>
				</div>
				<div class="panel-footer">Overall: ${row.other}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Private Health Insurance</div>
				<div class="panel-body">
					<div id="payer_private"></div>
				</div>
				<div class="panel-footer">Overall: ${row.priv}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=payer_concept_name&value=Medicaid" />
	<jsp:param name="dom_element" value="#payer_medicaid" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=payer_concept_name&value=Medicare" />
	<jsp:param name="dom_element" value="#payer_medicare" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=payer_concept_name&value=Other Payer" />
	<jsp:param name="dom_element" value="#payer_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=payer_concept_name&value=Private Health Insurance" />
	<jsp:param name="dom_element" value="#payer_private" />
</jsp:include>

