<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(table_1__table_of_all_patient_characteristics_by_covid_statu)) from enclave_cohort.table_1__table_of_all_patient_characteristics_by_covid_statu;
</sql:query>
{
    "headers": [
        {"value":"variable", "label":"Variable"},
        {"value":"value", "label":"Value"},
        {"value":"x__all", "label":"All"},
        {"value":"no_covid_test", "label":"No COVID Test"},
        {"value":"suspected_covid", "label":"Suspected COVID"},
        {"value":"lab_confirmed_negative", "label":"Lab Confirmed Negative"},
        {"value":"lab_confirmed_positive", "label":"Lab Confirmed Positive"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			