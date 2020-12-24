<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select * from (
		select 1 as seq, 'Mild' as element, substring(mild from '[0-9.]+')::float as count
		from enclave_cohort.${param.table}
		where ${param.column}='${param.value}'<c:if test="${not empty param.variable}"> and variable='${param.variable}'</c:if>
	union
		select 2 as seq, 'Mild ED' as element, substring(mild_ed from '[0-9.]+')::float as count
		from enclave_cohort.${param.table}
		where ${param.column}='${param.value}'<c:if test="${not empty param.variable}"> and variable='${param.variable}'</c:if>
	union
		select 3 as seq, 'Moderate' as element, substring(moderate from '[0-9.]+')::float as count
		from enclave_cohort.${param.table}
		where ${param.column}='${param.value}'<c:if test="${not empty param.variable}"> and variable='${param.variable}'</c:if>
	union
		select 4 as seq,  'Severe' as element, substring(severe from '[0-9.]+')::float as count
		from enclave_cohort.${param.table}
		where ${param.column}='${param.value}'<c:if test="${not empty param.variable}"> and variable='${param.variable}'</c:if>
	union
		select 5 as seq, 'Dead w/ COVID' as element, substring(dead_w_covid from '[0-9.]+')::float as count
		from enclave_cohort.${param.table}
		where ${param.column}='${param.value}'<c:if test="${not empty param.variable}"> and variable='${param.variable}'</c:if>
	) as foo order by seq;
</sql:query>

[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"${row.element}","count":${row.count}}<c:if test="${ rowCounter.count < elements.rowCount }">,</c:if>
	</c:forEach>
  ]
		