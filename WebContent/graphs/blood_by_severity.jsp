<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Blood Type</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
	select to_char(x__all::int,'999,999') as x__all, to_char(mild::int,'999,999') as mild, to_char(mild_ed::int,'999,999') as mild_ed,
	       to_char(moderate::int,'999,999') as moderate, to_char(severe::int,'999,999') as severe, to_char(dead_w_covid::int,'999,999') as dead_w_covid
	from enclave_cohort.censored_blood_type_for_api where value='Unknown';
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">All Patients</div>
				<div class="panel-body">
					<div id="blood_all"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.x__all}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Mild</div>
				<div class="panel-body">
					<div id="blood_mild"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.mild}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Mild ED</div>
				<div class="panel-body">
					<div id="blood_mild_ed"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.mild_ed}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Moderate</div>
				<div class="panel-body">
					<div id="blood_moderate"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.moderate}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Severe</div>
				<div class="panel-body">
					<div id="blood_severe"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.severe}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Dead w/ COVID</div>
				<div class="panel-body">
					<div id="blood_dead"></div>
				</div>
				<div class="panel-footer">Unknowns: ${row.dead_w_covid}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=x__all&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_all" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=mild&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_mild" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=mild_ed&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_mild_ed" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=moderate&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_moderate" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=severe&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_severe" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/columnFreqData.jsp?column=value&value=dead_w_covid&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_dead" />
</jsp:include>
