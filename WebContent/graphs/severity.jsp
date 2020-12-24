<ul class="nav nav-tabs" style="font-size:16px;">
	<li class="active"><a data-toggle="tab" href="#misc">Misc</a></li>
	<li><a data-toggle="tab" href="#severity_by_ethnicity">Ethnicity</a></li>
	<li><a data-toggle="tab" href="#severity_by_gender">Gender</a></li>
	<li><a data-toggle="tab" href="#severity_by_payer">Payer</a></li>
	<li><a data-toggle="tab" href="#severity_by_race">Race</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="misc">
	<jsp:include page="severity_misc.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="severity_by_ethnicity">
	<jsp:include page="severity_ethnicity.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="severity_by_gender">
	<jsp:include page="severity_gender.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="severity_by_payer">
	<jsp:include page="severity_payer.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="severity_by_race">
	<jsp:include page="severity_race.jsp" flush="true" />
</div>
</div>
