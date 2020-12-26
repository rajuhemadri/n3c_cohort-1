<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Payer</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as medicaid from enclave_cohort.severity_table2_for_export where value='Medicaid') as medicaid
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as medicare from enclave_cohort.severity_table2_for_export where value='Medicare') as medicare
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.severity_table2_for_export where value='Other Payer') as other
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as priv from enclave_cohort.severity_table2_for_export where value='Private Health Insurance') as private
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicaid</div>
				<div class="panel-body">
					<div id="severity_payer_medicaid"></div>
					<p>Total: ${row.medicaid}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Medicare</div>
				<div class="panel-body">
					<div id="severity_payer_medicare"></div>
					<p>Total: ${row.medicare}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other Payer</div>
				<div class="panel-body">
					<div id="severity_payer_other"></div>
					<p>Total: ${row.other}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Private Health Insurance</div>
				<div class="panel-body">
					<div id="severity_payer_private"></div>
					<p>Total: ${row.priv}</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicaid" />
	<jsp:param name="dom_element" value="#severity_payer_medicaid" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicare" />
	<jsp:param name="dom_element" value="#severity_payer_medicare" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Other Payer" />
	<jsp:param name="dom_element" value="#severity_payer_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Private Health Insurance" />
	<jsp:param name="dom_element" value="#severity_payer_private" />
</jsp:include>

