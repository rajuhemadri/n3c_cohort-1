<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Various Data for Severe COVID-19  Cases Drawn from the Various Tabs</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as black from enclave_cohort.severity_table2_for_export where value='Black or African American') as black
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as white from enclave_cohort.severity_table2_for_export where value='White') as white
	on true
	left join
	(select to_char(severe::int,'999,999') as blood_severe from enclave_cohort.censored_blood_type_for_api where value='Unknown') as blood_severe
	on true
	left join
	(select to_char(substring(severe from '[0-9]+')::int,'999,999') as med_severe from enclave_cohort.med_use_frequency_for_export where value='Totals')  as med_severe
	on true
	left join
	(select to_char(substring(severe from '[0-9]+')::int,'999,999') as charlson_severe from enclave_cohort.charlson_frequency_for_export where value='Totals') as charlson_severe
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as medicaid from enclave_cohort.severity_table2_for_export where value='Medicaid') as medicaid
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999,999') as priv from enclave_cohort.severity_table2_for_export where value='Private Health Insurance') as private
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Severity - Race: Black or African American</div>
				<div class="panel-body">
					<div id="home_race_black"></div>
					<p>Total: ${row.black}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Severity - Race: White</div>
				<div class="panel-body">
					<div id="home_race_white"></div>
					<p>Total: ${row.white}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Blood Type - Severe Cases</div>
				<div class="panel-body">
					<div id="home_blood_severe"></div>
					<p>Total: ${row.blood_severe}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Medication Use - Severe Cases</div>
				<div class="panel-body">
					<div id="home_med"></div>
					<p>Total: ${row.med_severe}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Charlson - Severe Cases</div>
				<div class="panel-body">
					<div id="home_charlson_severe"></div>
					<p>Total: ${row.charlson_severe}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Severity - Payer: Medicaid</div>
				<div class="panel-body">
					<div id="home_payer_medicaid"></div>
					<p>Total: ${row.medicaid}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Severity - Payer: Private Health Insurance</div>
				<div class="panel-body">
					<div id="home_payer_private"></div>
					<p>Total: ${row.priv}</p>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=severe&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#home_blood_severe" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=severe&table=med_use_frequency_for_export" />
	<jsp:param name="dom_element" value="#home_med" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=severe&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#home_charlson_severe" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=Black+or+African+American" />
	<jsp:param name="dom_element" value="#home_race_black" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#home_race_white" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicaid" />
	<jsp:param name="dom_element" value="#home_payer_medicaid" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Private Health Insurance" />
	<jsp:param name="dom_element" value="#home_payer_private" />
</jsp:include>
