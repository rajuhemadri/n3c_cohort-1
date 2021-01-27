<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Charlson Frequency</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select to_char(substring(x__all::text from '[0-9]+')::int,'999,999') as x__all, to_char(substring(mild from '[0-9]+')::int,'999,999') as mild,
	       to_char(substring(mild_ed from '[0-9]+')::int,'999,999') as mild_ed, to_char(substring(moderate from '[0-9]+')::int,'999,999') as moderate,
	       to_char(substring(severe from '[0-9]+')::int,'999,999') as severe, to_char(substring(dead_w_covid from '[0-9]+')::int,'999,999') as dead_w_covid
	from enclave_cohort.charlson_frequency_for_export where value='Totals';
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">All Patients</div>
				<div class="panel-body">
					<div id="charlson_all"></div>
				</div>
				<div class="panel-footer">n = ${row.x__all}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Mild</div>
				<div class="panel-body">
					<div id="charlson_mild"></div>
				</div>
				<div class="panel-footer">n = ${row.mild}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Mild ED</div>
				<div class="panel-body">
					<div id="charlson_mild_ed"></div>
				</div>
				<div class="panel-footer">n = ${row.mild_ed}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Moderate</div>
				<div class="panel-body">
					<div id="charlson_moderate"></div>
				</div>
				<div class="panel-footer">n = ${row.moderate}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Severe</div>
				<div class="panel-body">
					<div id="charlson_severe"></div>
				</div>
				<div class="panel-footer">n = ${row.severe}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">Dead w/ COVID</div>
				<div class="panel-body">
					<div id="charlson_dead"></div>
				</div>
				<div class="panel-footer">n = ${row.dead_w_covid}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=x__all&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_all" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=mild&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_mild" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=mild_ed&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_mild_ed" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=moderate&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_moderate" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=severe&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_severe" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=dead_w_covid&table=charlson_frequency_for_export" />
	<jsp:param name="dom_element" value="#charlson_dead" />
</jsp:include>
