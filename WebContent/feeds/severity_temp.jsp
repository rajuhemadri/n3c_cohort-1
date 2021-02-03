<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select abbrev as element,${param.severity}::int/1000.0 as count from enclave_cohort.table_1__table_of_all_patient_characteristics_by_covid_statu natural join enclave_cohort.race_map where variable='Race' order by seq;
</sql:query>

[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"${row.element}","count":${row.count}}<c:if test="${ rowCounter.count < elements.rowCount }">,</c:if>
	</c:forEach>
  ]
