<ul class="nav nav-tabs" style="font-size:16px;">
	<li class="active"><a data-toggle="tab" href="#misc">Misc</a></li>
	<li><a data-toggle="tab" href="#by_ethnicity">Ethnicity</a></li>
	<li><a data-toggle="tab" href="#by_gender">Gender</a></li>
	<li><a data-toggle="tab" href="#by_payer">Payer</a></li>
	<li><a data-toggle="tab" href="#by_race">Race</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="misc">
	<jsp:include page="characteristics_misc.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="by_ethnicity">
	<jsp:include page="characteristics_ethnicity.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="by_gender">
	<jsp:include page="characteristics_gender.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="by_payer">
	<jsp:include page="characteristics_payer.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="by_race">
	<jsp:include page="characteristics_race.jsp" flush="true" />
</div>
</div>
