
<h3>Charlson Frequency</h3>
<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">All Patients</div>
			<div id="charlson_all" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Mild</div>
			<div id="charlson_mild" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Mild ED</div>
			<div id="charlson_mild_ed" class="panel-body"></div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Moderate</div>
			<div id="charlson_moderate" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Severe</div>
			<div id="charlson_severe" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Dead w/ COVID</div>
			<div id="charlson_dead" class="panel-body"></div>
		</div>
	</div>
</div>

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
