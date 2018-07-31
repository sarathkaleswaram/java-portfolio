

function showHolidaysGroupDetails(holidayGroupId){
	jQuery.ajax
    ({
    		traditional: true,
  	  		type: "GET",
            data:{customerId:customerPoId},
			url: contextPath + "/holidayGroup/get/holidayGroupPopUp",
			scriptCharset: "utf-8" ,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data,status){
            	showModelDialog(data.holidayGroupTo)
             },
             error: function(){
            	 alert('An unexpected error has occurred.');
             }
    });

}


function showModelDialog(holidayGroupTo){
	if(holidayGroupTo){
		var htmlText = '<table class="table table-striped" id="tblGrid">';
		htmlText +='<tr><td class="text-right">Account Manager : </td><td class="text-left">'+holidayGroupTo.holidaysGroupName+'</td></tr>';
		htmlText +='<tr><td class="text-right">Account : </td><td class="text-left">'+holidayGroupTo.tblHolidaysListTo.tblHolidaysTo.holidayName+'</td></tr>';
		
		htmlText +='</tbody></table>';
		jQuery("#" +
				"").html(htmlText);
	}
	jQuery("#customerPoDetailsModel").modal(); // initializes and invokes show immediately
}





