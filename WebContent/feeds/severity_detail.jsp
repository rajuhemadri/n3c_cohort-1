<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select
		substring(mild from '^[0-9.]+')::float as mild,
		substring(mild_ed from '^[0-9.]+')::float as mild_ed,
		substring(moderate from '^[0-9.]+')::float as moderate,
		substring(severe from '^[0-9.]+')::float as severe,
		substring(dead_w_covid from '^[0-9.]+')::float as dead_w_covid
	from enclave_cohort.severity_table2_for_export where variable='${param.variable}'<c:if test="${not empty param.value}"> and value='${param.value}'</c:if>;
</sql:query>

[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"Mild","count":${row.mild}},
	    {"element":"Mild ED","count":${row.mild_ed}},
	    {"element":"Moderate","count":${row.moderate}},
	    {"element":"Severe","count":${row.severe}},
	    {"element":"Dead w/ COVID","count":${row.dead_w_covid}}
	</c:forEach>
  ]
