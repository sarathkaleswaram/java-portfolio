
function showCustomerPoDetails(t){
$.ajax({ 
	traditional: true,
    type : "GET",   
    data:{id:t},
    url : "../adminActivity/view",   
   
	contentType: "application/json; charset=UTF-8",
    success : function(data) {
    	
    	var htmlText = '<table  class="table-wrapper table-bordered table-condensed table-hover table-striped table" id="tblGrid">';
		data.forEach(function(t) {
			console.log(t)
			if(t){
				
		    	
		    	if(t.notes!=null){
		    		htmlText +='<thead><tr><th style="width:05%">Date</th><th style="width:30%">'+t.notesDate+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+t.employeeName+'</th></tr><thead>';
				htmlText +='<tbody><tr><td class="text-left">Notes</td><td ><font face="" color="#9E5CE1" ><strong>'+t.notes+'</font></strong></td></tr></tbody>';
		    	}
			}
		});
		htmlText +='</table>';
		
		jQuery("#customerDetails").html(htmlText);
		jQuery("#customerPoDetailsModel").modal(); 
    },  
    error : function(e) {  
     alert('Error: ' + e);   
    }  
   }); 
}


	



