<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<h3>Various Data for Severe COVID-19  Cases Drawn from the Various Tabs</h3>

<p>The architecture for this application is completely modular. Each tile is independently populated from the underlying database through one of
four visualization scripts (the scatter plot just below, large and small bar charts and a pie chart) parameterized with the appropriate query
constraints. This main landing page draws from the tiles in the respective tabs to demonstrate the ability to structure cross-cutting views.</p>

	
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
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Severity</b> - Race: <span  style="font-weight:normal">Black or African American</span></div>
				<div class="panel-body">
					<div id="home_race_black"></div>
				</div>
				<div class="panel-footer">Total: ${row.black}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Severity</b> - Race: <span  style="font-weight:normal">White</span></div>
				<div class="panel-body">
					<div id="home_race_white"></div>
				</div>
				<div class="panel-footer">Total: ${row.white}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Blood Type</b> - Severe Cases</div>
				<div class="panel-body">
					<div id="home_blood_severe"></div>
				</div>
				<div class="panel-footer">Total: ${row.blood_severe}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Medication Use</b> - Severe Cases</div>
				<div class="panel-body">
					<div id="home_med"></div>
				</div>
				<div class="panel-footer">Total: ${row.med_severe}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Charlson</b> - Severe Cases</div>
				<div class="panel-body">
					<div id="home_charlson_severe"></div>
				</div>
				<div class="panel-footer">Total: ${row.charlson_severe}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Severity</b> - Payer: <span  style="font-weight:normal">Medicaid</span></div>
				<div class="panel-body">
					<div id="home_payer_medicaid"></div>
				</div>
				<div class="panel-footer">Total: ${row.medicaid}</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading"><b>Severity</b> - Payer: <span  style="font-weight:normal">Private Health Insurance</span></div>
				<div class="panel-body">
					<div id="home_payer_private"></div>
				</div>
				<div class="panel-footer">Total: ${row.priv}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/scatterplot.jsp">
	<jsp:param name="data_page"	value="feeds/charlson_scatter.jsp?x_value=DM&y_value=Pulmonary" />
	<jsp:param name="dom_element" value="#scatter_plot" />
	<jsp:param name="xLabel" value="DM %" />
	<jsp:param name="yLabel" value="Pulmonary %" />
</jsp:include>

				<script type="text/javascript">
					function plot(xAxis, yAxis) {
						d3.html("graphs/charlson_scatter.jsp?x_value="+xAxis+"&y_value="+yAxis, function(fragment) {
							var divContainer = document.getElementById("scatter_panel");
							divContainer.innerHTML = "<div id=\"scatter_plot\"></div>";
							divContainer.append(fragment);
						});
					}
				</script>

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
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#home_race_white" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Medicaid" />
	<jsp:param name="dom_element" value="#home_payer_medicaid" />
	<jsp:param name="html" value="percentage" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/severity_detail.jsp?variable=payer_concept_name&value=Private Health Insurance" />
	<jsp:param name="dom_element" value="#home_payer_private" />
	<jsp:param name="html" value="percentage" />
</jsp:include>
