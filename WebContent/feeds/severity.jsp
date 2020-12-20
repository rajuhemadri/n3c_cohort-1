<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(severity_table2_for_export)) from enclave_cohort.severity_table2_for_export;
</sql:query>
{
    "headers": [
        {"value":"variable", "label":"Variable"},
        {"value":"value", "label":"Value"},
        {"value":"x__all", "label":"All"},
        {"value":"mild", "label":"Mild"},
        {"value":"mild_ed", "label":"Mild ED"},
        {"value":"moderate", "label":"Moderate"},
        {"value":"severe", "label":"Severe"},
        {"value":"dead_w_covid", "label":"Dead w/ COVID"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			