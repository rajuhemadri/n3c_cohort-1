<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select ${param.column} as element,substring(${param.value} from '[0-9]+')::int as  count  from enclave_cohort.${param.table} where value!='Unknown' and value!='Totals' order by 2 desc;
</sql:query>

[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"${row.element}","count":${row.count}}<c:if test="${ rowCounter.count < elements.rowCount }">,</c:if>
	</c:forEach>
  ]
