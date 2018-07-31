
$( document ).ready(function() {

	if($('#workingHour').is(":checked")) {
		$('#fullDay').show();
		$('#halfDay').show();
		
	}
	else{
	$('#fullDay').hide();
	$('#halfDay').hide();
	
	}
});

$( document ).ready(function() {
$('#workingHour').click(function() {
	 if($(this).is(":checked")) {
  $('#fullDay').show();
  $('#halfDay').show();
}
	 else
		 {
		 $('#fullDay').hide();
		 if ($("#full").val() =="") {
		   
		             }
		 else{
			  $("#full").val('');
		 }
		 $('#halfDay').hide();
		 if ($("#half").val()=='') {
			 
		 }else
		 {
		     $("#half").val('');
		 }
		 }
});
});

$( document ).ready(function() {

	if($('#lossOfPayConditionStatus').is(":checked")) {
		$('#shw').show();
	}
	else{
	$('#shw').hide();
	 if ($("#poLineItemTable").val() =="") {
		   
     }
else{
$("#poLineItemTable").val('');
}
	
	}
});
$( document ).ready(function() {
$('#lossOfPayConditionStatus').click(function() {
	 if($(this).is(":checked")) {
  $('#shw').show();
 
}
	 else
		 {
		 $('#shw').hide();
		
		 }
		
});
});


function checkVal(t) {
	if (t.checked) {
		$(t).val("Y");
	} else {
		$(t).val("N");
	}
}

	


     $(function () {
    	  $('#half').datetimepicker({
    		  format: 'HH:mm',
    	  });
         $('#full').datetimepicker({
        	 format: 'HH:mm',
         });
         
     });






	$(document).ready(function() {

		$(function() {
			$('#shiftStTime').datetimepicker({
				format : 'HH:mm',
			});
			$('#shiftEndTime').datetimepicker({
				format : 'HH:mm',
			});
			$('.datepicker').datetimepicker({
				format : 'HH:mm',
			});

			 $('body').on('focus', ".datepicker", function() {
			        $(this).datetimepicker({format : 'HH:mm'});
			    });

		});

	});
	

	function addLineItem() {
	
		var tblBody = document.getElementById("poLineItemTable").tBodies[0];
		var newNode = tblBody.rows[0].cloneNode(true);
		var count;
		if (document.getElementById("rowCount").value) {
			count = parseInt(document.getElementById("rowCount").value) + 1;
		} else {
			count = 2;
		}
		var count = $('#poLineItemTable tr').length - 1;
		var cells = newNode.cells;
		newNode.id = count - 1;
		console.log("count", cells[1].firstElementChild.name)
		for (var i = 0; i < cells.length; i++) {
			if (i == 0) {
				cells[i].innerHTML = count;
				
				cells[1].firstElementChild.id = "tblAttendancePolicyLossTo[" + (count - 1) + "].fromDays";
				cells[1].firstElementChild.name = "tblAttendancePolicyLossTo[" + (count - 1) + "].fromDays";
				cells[1].firstElementChild.value = "";

				cells[3].firstElementChild.id = "tblAttendancePolicyLossTo[" + (count - 1) + "].lopDays" ;
				cells[3].firstElementChild.name = "tblAttendancePolicyLossTo[" + (count - 1) + "].lopDays";
				
				cells[3].firstElementChild.value = "";
				cells[2].firstElementChild.id = "tblAttendancePolicyLossTo[" + (count - 1) + "].toDays" ;
				cells[2].firstElementChild.name = "tblAttendancePolicyLossTo[" + (count - 1) + "].toDays";
				
				cells[2].firstElementChild.value = "";

				cells[4].firstElementChild.id = "tblAttendancePolicyLossTo[" + (count - 1) + "].applyLopForEachDay";
				cells[4].firstElementChild.name = "tblAttendancePolicyLossTo[" + (count - 1) + "].applyLopForEachDay";
				cells[4].firstElementChild.value = "";
			}
			tblBody.appendChild(newNode);
		}
	}
	function deleteRow(t) {
		var rowId = t.parentNode.parentNode.rowIndex;
		var row = t.parentNode.parentNode;
		console.log("row", parseInt(row.id))
		if (row.rowIndex != 2) {
			document.getElementById("poLineItemTable").deleteRow(row.rowIndex);
			var count = parseInt(document.getElementById("rowCount").value) - 1;
			document.getElementById("rowCount").value = count;
		}

		var table = document.getElementById('poLineItemTable');

		var rowLength = table.rows.length;
		var xx = parseInt(row.id);
		var i = xx + 2;

		for (var i = 2; i <= rowLength; i += 1) {
			var row;
			row = table.rows[i];
			if (i == rowLength) {
				row = table.rows[i - 1];
			}
			
			row.cells[1].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 2) + "].fromDays";
			row.cells[1].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 2) + "].fromDays";
			row.cells[3].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 2) + "].lopDays";
			row.cells[3].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 2) + "].lopDays";
			row.cells[2].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 2) + "].toDays";
			row.cells[2].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 2) + "].toDays";

			row.cells[4].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 2) + "].applyLopForEachDay";
			row.cells[4].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 2) + "].applyLopForEachDay";
			if (i == rowLength) {
				row = table.rows[i - 1];
				row.cells[1].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 3) + "].fromDays";
				row.cells[1].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 3) + "].fromDays";
				row.cells[3].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 3) + "].lopDays";
				row.cells[3].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 3) + "].lopDays";
				row.cells[2].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 3) + "].toDays";
				row.cells[2].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 3) + "].toDays";

				row.cells[4].firstElementChild.id = "tblAttendancePolicyLossTo[" + (i - 3) + "].applyLopForEachDay";
				row.cells[4].firstElementChild.name = "tblAttendancePolicyLossTo[" + (i - 3) + "].applyLopForEachDay";
			}
		}

	}
	