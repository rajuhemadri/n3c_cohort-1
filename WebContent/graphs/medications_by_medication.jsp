<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Medication Use</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select x__all, value from enclave_cohort.med_use_frequency_for_export where value != 'Totals' order by substring(x__all,'[0-9.]+')::float desc;
</sql:query>

<div class="row">
<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">${row.value}</div>
				<div class="panel-body">
					<div id="${row.value}"></div>
				</div>
				<div class="panel-footer">Overall: ${row.x__all}</div>
			</div>
		</div>
</c:forEach>
</div>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=${row.value}&table=med_use_frequency_for_export" />
	<jsp:param name="dom_element" value="#${row.value}" />
</jsp:include>
</c:forEach>
