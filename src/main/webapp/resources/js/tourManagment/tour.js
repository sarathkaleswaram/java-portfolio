jQuery(document).ready(function() {
	jQuery('#accountId').change(function(event) {
		
		var selectedCustomerId = jQuery(this).val();
		
		if(selectedCustomerId != null && selectedCustomerId != '' && selectedCustomerId != '0'){
			getAndPopulateCustomerDropDown(selectedCustomerId);
		}
		
	});
	

});
$(document).ready(function() {
	jQuery('.datepicker').datepicker({
		format : 'dd/mm/yyyy',
		changeMonth : true,
		changeYear : true,
		autoclose : true,
		startDate : new Date()
	});
});
function getAndPopulateCustomerDropDown(selectedCustomerId){
	$('#poid').empty();
	$.ajax({
		traditional : true,
		type : "GET",
		data : {
			customerId : selectedCustomerId,

		},
		url :  "../tour/getName/",
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


function daysOnChange(){
	
	var stateOption
	var fromCheck
	if(document.getElementById('two').checked) {
		stateOption="N";
		}
	if(document.getElementById('one').checked) {
		stateOption="Y";
		}
	if(document.getElementById('three').checked) {
		fromCheck="Y";
		}
	if(document.getElementById('four').checked) {
		fromCheck="N";
		}
$.ajax({  
    type : "GET",   
    url : "../tour/getDays",   
    data : { fromDate :$("#fromDate").val() , toDate : $("#toDate").val(),fromFull:stateOption,toFull:fromCheck},
	contentType: "application/json; charset=UTF-8",
    success : function(data) {  
   	 console.log(data);   
   		$("#totalDays").val(data);
    },  
    error : function(e) {  
//      alert('Error: ' + e);   
    }  
   }); 
}
