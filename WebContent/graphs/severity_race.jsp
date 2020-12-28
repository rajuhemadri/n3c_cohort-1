<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Race</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as amind from enclave_cohort.severity_table2_for_export where value='American Indian or Alaska Native') as amind
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as asian from enclave_cohort.severity_table2_for_export where value='Asian') as asian
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as black from enclave_cohort.severity_table2_for_export where value='Black or African American') as black
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as unknown from enclave_cohort.severity_table2_for_export where value='Missing/Unknown' and variable='Race') as unknown
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as hawaiian from enclave_cohort.severity_table2_for_export where value='Native Hawaiian or Other Pacific Islander') as hawaiian
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as other from enclave_cohort.severity_table2_for_export where value='Other' and variable='Race') as other
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as white from enclave_cohort.severity_table2_for_export where value='White') as white
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">American Indian or Alaska Native</div>
				<div class="panel-body">
					<div id="severity_race_amind"></div>
				</div>
				<div class="panel-footer">Total: ${row.amind}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Asian</div>
				<div class="panel-body">
					<div id="severity_race_asian"></div>
				</div>
				<div class="panel-footer">Total: ${row.asian}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Black or African American</div>
				<div class="panel-body">
					<div id="severity_race_black"></div>
				</div>
				<div class="panel-footer">Total: ${row.black}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="severity_race_missing"></div>
				</div>
				<div class="panel-footer">Total: ${row.unknown}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Native Hawaiian or Other Pacific Islander</div>
				<div class="panel-body">
					<div id="severity_race_hawaiian"></div>
				</div>
				<div class="panel-footer">Total: ${row.hawaiian}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="severity_race_other"></div>
				</div>
				<div class="panel-footer">Total: ${row.other}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">White</div>
				<div class="panel-body">
					<div id="severity_race_white"></div>
\				</div>
				<div class="panel-footer">Total: ${row.white}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=American+Indian+or+Alaska+Native" />
	<jsp:param name="dom_element" value="#severity_race_amind" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Asian" />
	<jsp:param name="dom_element" value="#severity_race_asian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Black+or+African+American" />
	<jsp:param name="dom_element" value="#severity_race_black" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#severity_race_missing" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Native+Hawaiian+or+Other+Pacific+Islander" />
	<jsp:param name="dom_element" value="#severity_race_hawaiian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Other" />
	<jsp:param name="dom_element" value="#severity_race_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#severity_race_white" />
</jsp:include>
