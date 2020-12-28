<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="values" dataSource="jdbc/N3CCohort">
	select substring(x.mild from '[0-9.]+')::float as x, substring(y.mild from '[0-9.]+')::float as y, 'Mild' as label
	from (select mild from enclave_cohort.charlson_frequency_for_export where value='${param.x_value}') as x,
	     (select mild from enclave_cohort.charlson_frequency_for_export where value='${param.y_value}') as y
	union
	select substring(x.mild_ed from '[0-9.]+')::float as x, substring(y.mild_ed from '[0-9.]+')::float as y, 'Mild ED' as label
	from (select mild_ed from enclave_cohort.charlson_frequency_for_export where value='${param.x_value}') as x,
	     (select mild_ed from enclave_cohort.charlson_frequency_for_export where value='${param.y_value}') as y
	union
	select substring(x.moderate from '[0-9.]+')::float as x, substring(y.moderate from '[0-9.]+')::float as y, 'Moderate' as label
	from (select moderate from enclave_cohort.charlson_frequency_for_export where value='${param.x_value}') as x,
	     (select moderate from enclave_cohort.charlson_frequency_for_export where value='${param.y_value}') as y
	union
	select substring(x.severe from '[0-9.]+')::float as x, substring(y.severe from '[0-9.]+')::float as y, 'Severe' as label
	from (select severe from enclave_cohort.charlson_frequency_for_export where value='${param.x_value}') as x,
	     (select severe from enclave_cohort.charlson_frequency_for_export where value='${param.y_value}') as y
	union
	select substring(x.dead_w_covid from '[0-9.]+')::float as x, substring(y.dead_w_covid from '[0-9.]+')::float as y, 'Dead w/ COVID' as label
	from (select dead_w_covid from enclave_cohort.charlson_frequency_for_export where value='${param.x_value}') as x,
	     (select dead_w_covid from enclave_cohort.charlson_frequency_for_export where value='${param.y_value}') as y
</sql:query>
[
<c:forEach items="${values.rows}" var="row" varStatus="rowCounter">
	[${row.x}, ${row.y}, "${row.label}"]<c:if test="${rowCounter.count < values.rowCount}">,</c:if>
</c:forEach>
];

			