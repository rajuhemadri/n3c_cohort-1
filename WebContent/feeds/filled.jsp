<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(filled_cc_tag_table_for_export_tagtable)) from enclave_cohort.filled_cc_tag_table_for_export_tagtable;
</sql:query>
{
    "headers": [
        {"value":"tag", "label":"Tag"},
        {"value":"value", "label":"Value"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			