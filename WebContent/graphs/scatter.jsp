<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<h3>Various Data for Severe COVID-19  Cases Drawn from the Various Tabs</h3>

	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">Charlson Scatter Plot Selection</div>
				<div class="panel-body">
					<form onchange="plot(x_axis.value, y_axis.value)">
					<sql:query var="values" dataSource="jdbc/N3CCohort">
						select value from enclave_cohort.charlson_frequency_for_export where value != 'Totals' order by 1;
					</sql:query>
					<label for="x_axis">Choose a Metric for the X Axis:</label>
					<select name="x_axis" id="x_axis" >
					<c:forEach items="${values.rows}" var="row" varStatus="rowCounter">
						<option value="${row.value}" <c:if test="${'DM' == row.value}">selected</c:if>>${row.value}</option>
					</c:forEach>
					</select>
					<br>
					<label for="y_axis">Choose a Metric for the Y Axis:</label>
					<select name="y_axis" id="y_axis" >
					<c:forEach items="${values.rows}" var="row" varStatus="rowCounter">
						<option value="${row.value}" <c:if test="${'Pulmonary' == row.value}">selected</c:if>>${row.value}</option>
					</c:forEach>
					</select>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">Charlson Scatter Plot</div>
				<div class="panel-body">
					<!--  This funky little div eliminates flicker as the SVG is swapped out. Keep it slightly bigger than the scatter plot. -->
					<div id="scatter_filler" style="width:1px; height:1px; float:left;"></div>
					<div id="scatter_panel">
						<div id="scatter_plot"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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

