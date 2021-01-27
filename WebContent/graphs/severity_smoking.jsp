<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Smoking Status</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all::text from '[0-9.]+')::float, '999,999,999') as smoker from enclave_cohort.severity_table2_for_export where value='Current or Former') as smoker
	left join
	(select to_char(substring(x__all::text from '[0-9.]+')::float, '999,999,999') as non from enclave_cohort.severity_table2_for_export where value='Non smoker') as non
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Current or Former</div>
				<div class="panel-body">
					<div id="severity_smoking_current"></div>
				</div>
				<div class="panel-footer">Total: ${row.smoker}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Non Smoker</div>
				<div class="panel-body">
					<div id="severity_smoking_non"></div>
				</div>
				<div class="panel-footer">Total: ${row.non}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=smoking_status&value=Current or Former" />
	<jsp:param name="dom_element" value="#severity_smoking_current" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=smoking_status&value=Non smoker" />
	<jsp:param name="dom_element" value="#severity_smoking_non" />
	<jsp:param name="html" value="percentage" />
</jsp:include>
