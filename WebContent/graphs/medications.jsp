<ul class="nav nav-tabs" style="font-size:16px;">
	<li class="active"><a data-toggle="tab" href="#med_by_severity">by Severity</a></li>
	<li><a data-toggle="tab" href="#med_by_medication">by Medication</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="med_by_severity">
	<jsp:include page="medications_by_severity.jsp" flush="true" />
</div>
<div class="tab-pane fade" id="med_by_medication">
	<jsp:include page="medications_by_medication.jsp" flush="true" />
</div>
</div>
