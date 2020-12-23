<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Race</h3>

	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">American Indian or Alaska Native</div>
				<div class="panel-body">
					<div id="race_amind"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Asian</div>
				<div class="panel-body">
					<div id="race_asian"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Black or African American</div>
				<div class="panel-body">
					<div id="race_black"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Missing/Unknown</div>
				<div class="panel-body">
					<div id="race_missing"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Native Hawaiian or Other Pacific Islander</div>
				<div class="panel-body">
					<div id="race_hawaiian"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">Other</div>
				<div class="panel-body">
					<div id="race_other"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading">White</div>
				<div class="panel-body">
					<div id="race_white"></div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=American+Indian+or+Alaska+Native" />
	<jsp:param name="dom_element" value="#race_amind" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Asian" />
	<jsp:param name="dom_element" value="#race_asian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Black+or+African+American" />
	<jsp:param name="dom_element" value="#race_black" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Missing/Unknown" />
	<jsp:param name="dom_element" value="#race_missing" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Native+Hawaiian+or+Other+Pacific+Islander" />
	<jsp:param name="dom_element" value="#race_hawaiian" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=Other" />
	<jsp:param name="dom_element" value="#race_other" />
</jsp:include>

<jsp:include page="../graph_support/verticalBarChart.jsp">
	<jsp:param name="data_page"	value="feeds/characteristics_misc.jsp?variable=Race&value=White" />
	<jsp:param name="dom_element" value="#race_white" />
</jsp:include>
