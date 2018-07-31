$(document).ready(function() {

	$(function() {
		$('#fromDate').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#toDate').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});

	});

	jQuery('#accountId').change(function(event) {

		var selectedCustomerId = jQuery(this).val();

		if (selectedCustomerId != null && selectedCustomerId != '' && selectedCustomerId != '0') {
			getAndPopulateCustomerDropDown(selectedCustomerId);
		}

	});
	jQuery('#fromDate,#toDate').focusout(function(event) {
		var start = $("#fromDate").val();

		var end = $("#toDate").val();

		if (start != null && start != '' && start != '0' && end != null && end != '' && end != '0') {
			getduration(start, end);
		}

	});

});
function getAndPopulateCustomerDropDown(selectedCustomerId) {
	$('#poid').empty();
	$.ajax({
		traditional : true,
		type : "GET",
		data : {
			customerId : selectedCustomerId,
		// actionType : actionType
		},
		url : "../tour/getName/",
		scriptCharset : "utf-8",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data, status) {
			console.log(data)
			$('#poid').val(data);
		

		},
		error : function() {
			alert('An unexpected error has occurred.');
		},
	});
}

function getduration(start, end) {
	$('#duration').empty();
	$.ajax({
		traditional : true,
		type : "GET",
		data : {

			start : start,
			end : end,

		},
		url : "../onDuty/duration/",
		scriptCharset : "utf-8",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data, status) {

			$('#duration').val(data);

		},
		error : function() {
			alert('An unexpected error has occurred.');
		},
	});
}
