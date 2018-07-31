$(document).ready(function() {
	$(function() {
		$('#onDutyFromDate').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#onDutytodate').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#otApprovalDate').datetimepicker({
			format : 'DD/MM/YYYY'
		});
		
		$('#otHours').datetimepicker({
			format : 'HH:mm'
		});
		
		$('#attendenceSwipeIn').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#attendenceSwipeOut').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#in2').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out2').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#in3').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
			
		});
		$('#out3').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#in4').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out4').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#in5').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out5').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		
		$('#in6').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out6').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#in7').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out7').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#in8').datetimepicker({
			format : 'DD/MM/YYYY HH:mm',
			sideBySide : true,
		});
		$('#out8').datetimepicker({
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
	
	jQuery('#onDutyFromDate,#onDutytodate').focusout(function(event) {
		var start = $("#onDutyFromDate").val();

		var end = $("#onDutytodate").val();

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

var update_pizza = function () {
};




















