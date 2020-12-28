<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Blood Type</h3>

<sql:query var="elements" dataSource="jdbc/N3CCohort">
select * from 
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as a_neg from enclave_cohort.censored_blood_type_for_api where value='A Neg') as a_neg
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as a_pos from enclave_cohort.censored_blood_type_for_api where value='A Pos') as a_pos
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as ab_neg from enclave_cohort.censored_blood_type_for_api where value='AB Neg') as ab_neg
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as ab_pos from enclave_cohort.censored_blood_type_for_api where value='AB Pos') as ab_pos
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as b_neg from enclave_cohort.censored_blood_type_for_api where value='B Neg') as b_neg
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as b_pos from enclave_cohort.censored_blood_type_for_api where value='B Pos') as b_pos
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as o_neg from enclave_cohort.censored_blood_type_for_api where value='O Neg') as o_neg
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as o_pos from enclave_cohort.censored_blood_type_for_api where value='O Pos') as o_pos
	on true
	left join
	(select to_char(substring(x__all from '[0-9]+')::int, '999,999') as unknown from enclave_cohort.censored_blood_type_for_api where value='Unknown') as unknown
	on true
</sql:query>

<c:forEach items="${elements.rows}" var="row" varStatus="rowCounter">
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">A Negative</div>
				<div class="panel-body">
					<div id="blood_a_neg"></div>
				</div>
				<div class="panel-footer">Total: ${row.a_neg}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">A Positive</div>
				<div class="panel-body">
					<div id="blood_a_pos"></div>
				</div>
				<div class="panel-footer">Total: ${row.a_pos}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">AB Negative</div>
				<div class="panel-body">
					<div id="blood_ab_neg"></div>
				</div>
				<div class="panel-footer">Total: ${row.ab_neg}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">AB Positive</div>
				<div class="panel-body">
					<div id="blood_ab_pos"></div>
				</div>
				<div class="panel-footer">Total: ${row.ab_pos}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">B Negative</div>
				<div class="panel-body">
					<div id="blood_b_neg"></div>
				</div>
				<div class="panel-footer">Total: ${row.b_neg}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">B Positive</div>
				<div class="panel-body">
					<div id="blood_b_pos"></div>
				</div>
				<div class="panel-footer">Total: ${row.b_pos}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">O Negative</div>
				<div class="panel-body">
					<div id="blood_o_neg"></div>
				</div>
				<div class="panel-footer">Total: ${row.o_neg}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">O Positive</div>
				<div class="panel-body">
					<div id="blood_o_pos"></div>
				</div>
				<div class="panel-footer">Total: ${row.o_pos}</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">Unknown</div>
				<div class="panel-body">
					<div id="blood_unknown"></div>
				</div>
				<div class="panel-footer">Total: ${row.unknown}</div>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=A+Neg&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_a_neg" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=A+Pos&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_a_pos" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=AB+Neg&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_ab_neg" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=AB+Pos&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_ab_pos" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=B+Neg&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_b_neg" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=B+Pos&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_b_pos" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=O+Neg&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_o_neg" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=O+Pos&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_o_pos" />
</jsp:include>

<jsp:include page="../graph_support/pieChart.jsp">
	<jsp:param name="data_page"	value="graphs/rowFreqData.jsp?column=value&value=Unknown&table=censored_blood_type_for_api" />
	<jsp:param name="dom_element" value="#blood_unknown" />
</jsp:include>
