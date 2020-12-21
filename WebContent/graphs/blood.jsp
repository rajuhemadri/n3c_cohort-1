
<h3>Blood Type</h3>
<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">All Patients</div>
			<div id="blood_all" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Mild</div>
			<div id="blood_mild" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Mild ED</div>
			<div id="blood_mild_ed" class="panel-body"></div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Moderate</div>
			<div id="blood_moderate" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Severe</div>
			<div id="blood_severe" class="panel-body"></div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">Dead w/ COVID</div>
			<div id="blood_dead" class="panel-body"></div>
		</div>
	</div>
</div>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=x__all&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_all" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=mild&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_mild" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=mild_ed&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_mild_ed" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=moderate&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_moderate" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=severe&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_severe" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"
		value="graphs/columnFreqData.jsp?column=value&value=dead_w_covid&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_dead" />
</jsp:include>
