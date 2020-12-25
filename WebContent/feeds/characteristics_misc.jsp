<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select
		substring(no_covid_test from '^[0-9.]+')::float as no_covid_test,
		substring(suspected_covid from '^[0-9.]+')::float as suspected_covid,
		substring(lab_confirmed_negative from '^[0-9.]+')::float as lab_confirmed_negative,
		substring(lab_confirmed_positive from '^[0-9.]+')::float as lab_confirmed_positive
	from enclave_cohort.all_patient_characteristics_by_covid_status where variable='${param.variable}'<c:if test="${not empty param.value}"> and value='${param.value}'</c:if>;
</sql:query>

[
	<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	    {"element":"No COVID Test","count":${row.no_covid_test}},
	    {"element":"Suspected COVID","count":${row.suspected_covid}},
	    {"element":"Lab Confirmed Negative","count":${row.lab_confirmed_negative}},
	    {"element":"Lab Confirmed Positive","count":${row.lab_confirmed_positive}}
	</c:forEach>
  ]
