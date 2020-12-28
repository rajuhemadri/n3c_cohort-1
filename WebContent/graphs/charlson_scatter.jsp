<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../graph_support/scatterplot.jsp">
	<jsp:param name="data_page"	value="feeds/charlson_scatter.jsp?x_value=${param.x_value}&y_value=${param.y_value}" />
	<jsp:param name="dom_element" value="#scatter_plot" />
	<jsp:param name="xLabel" value="${param.x_value} %" />
	<jsp:param name="yLabel" value="${param.y_value} %" />
</jsp:include>
