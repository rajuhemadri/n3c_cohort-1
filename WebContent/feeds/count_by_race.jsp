<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="drugs" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(done))
	from (
		select
			race,
			abbrev,
			seq,
			(select jsonb_agg(sub)
			 from (select ethnicity,sum
			 	   from enclave_cohort.race_hist_data as bar
			 	   where race_map2.race=bar.race
			 	     and covid_status_name = ?
			 	   ) as sub
			 ) as values
		from
			enclave_cohort.race_map2
		order by seq
	) as done;
	<sql:param>${param.status}</sql:param>
</sql:query>
<c:forEach items="${drugs.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
			