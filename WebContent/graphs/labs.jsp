<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Peak, Average and Nadir of Lab Tests</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select distinct alias,regexp_replace(alias, '[^A-Za-z0-9]', '_', 'g') as id, replace(alias,'%','%25') as var from enclave_cohort.peak_and_nadir_table_for_export order by alias;
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<h4>${row.alias}</h4>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Peak</div>
				<div class="panel-body">
					<div id="${row.id}_peak"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Average</div>
				<div class="panel-body">
					<div id="${row.id}_average"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Nadir</div>
				<div class="panel-body">
					<div id="${row.id}_nadir"></div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
<jsp:include page="../graph_support/smallVerticalBarChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=alias&value=${row.var}&variable=Peak&table=peak_and_nadir_table_for_export" />
	<jsp:param name="dom_element" value="#${row.id}_peak" />
	<jsp:param name="lables" value="100" />
	<jsp:param name="bars" value="200" />
</jsp:include>
<jsp:include page="../graph_support/smallVerticalBarChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=alias&value=${row.var}&variable=Average&table=peak_and_nadir_table_for_export" />
	<jsp:param name="dom_element" value="#${row.id}_average" />
</jsp:include>
<jsp:include page="../graph_support/smallVerticalBarChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=alias&value=${row.var}&variable=Nadir&table=peak_and_nadir_table_for_export" />
	<jsp:param name="dom_element" value="#${row.id}_nadir" />
</jsp:include>
</c:forEach>
