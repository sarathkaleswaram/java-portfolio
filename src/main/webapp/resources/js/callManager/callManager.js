function showCallManagerDetails(callManagerId){
	console.log("comming into showCallManagerDetails")
	jQuery.ajax
    ({
    		traditional: true,
  	  		type: "GET",
            data:{id:callManagerId},
			url: "../callManager/details",
			scriptCharset: "utf-8" ,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data){
            	console.log("success")
            	showModelDialog(data)
             },
             error: function(){
            	 alert('An unexpected error has occurred.');
             }
    });
}
function showModelDialog(tblMsoLcoDataTo){
	if(tblMsoLcoDataTo){
		var htmlText = '<table class="table table-striped" id="tblGrid">';
		htmlText +='<tr><td class="text-right">Enrolement No : </td><td class="text-left">'+tblMsoLcoDataTo.enrollmentNo+'</td><td class="text-right">Enrolement Type : </td><td class="text-left">'+tblMsoLcoDataTo.enrolementType+'</td><td class="text-right">Company Name : </td><td class="text-left">'+tblMsoLcoDataTo.companyName+'</td><td class="text-right">Contact Name : </td><td class="text-left">'+tblMsoLcoDataTo.contactName+'</td></tr>';
		htmlText +='<tr><td class="text-right">Email : </td><td class="text-left">'+tblMsoLcoDataTo.email+'</td><td class="text-right">Postal Reg No : </td><td class="text-left">'+tblMsoLcoDataTo.postalRegNo+'</td><td class="text-right">House No/Area : </td><td class="text-left">'+tblMsoLcoDataTo.houseNoArea+'</td><td class="text-right">Street : </td><td class="text-left">'+tblMsoLcoDataTo.street+'</td></tr>';
		htmlText +='<tr><td class="text-right">Village : </td><td class="text-left">'+tblMsoLcoDataTo.village+'</td><td class="text-right">Mandal : </td><td class="text-left">'+tblMsoLcoDataTo.mandal+'</td><td class="text-right">District : </td><td class="text-left">'+tblMsoLcoDataTo.district+'</td><td class="text-right">ZipCode: </td><td class="text-left">'+tblMsoLcoDataTo.zipCode+'</td></tr>';
		htmlText +='<tr><td class="text-right">Year Of Service : </td><td class="text-left">'+tblMsoLcoDataTo.yearOfService+'</td><td class="text-right">No of Employees : </td><td class="text-left">'+tblMsoLcoDataTo.noOfEmployees+'</td><td class="text-right">No of Subscriptions : </td><td class="text-left">'+tblMsoLcoDataTo.noOfSubscriptions+'</td><td class="text-right">No of connections : </td><td class="text-left">'+tblMsoLcoDataTo.noOfConnections+'</td></tr>';
		htmlText +='<tr><td class="text-right">Postal Exp Date : </td><td class="text-left">'+tblMsoLcoDataTo.postalExpDate+'</td><td class="text-right">Sub Station1 : </td><td class="text-left">'+tblMsoLcoDataTo.subStation1+'</td><td class="text-right">Sub Station2 : </td><td class="text-left">'+tblMsoLcoDataTo.subStation2+'</td><td class="text-right">Total connections : </td><td class="text-left">'+tblMsoLcoDataTo.totalConnections+'</td></tr>';
		/* htmlText +='<tr><hr></hr</tr>'; */
		/*
		 * htmlText +='<tr><td class="text-right">Enrolement Type : </td><td class="text-left">'+tblMsoLcoDataTo.enrolementType+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Po No : </td><td class="text-left">'+dataTo.poNo+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Po Date : </td><td class="text-left">'+dataTo.customerPoDate+'</td></tr>';
		 * if(customerPoTo.customerPoBaseamount!=null){ htmlText +='<tr><td class="text-right">Po
		 * Base Amount : </td><td class="text-left">'+dataTo.customerPoBaseamount+'</td></tr>'; }
		 * if(customerPoTo.customerPoTaxamount!=null){ htmlText +='<tr><td class="text-right">Po
		 * Tax Amount : </td><td class="text-left">'+dataTo.customerPoTaxamount+'</td></tr>'; }
		 * htmlText +='<tr><td class="text-right">Po Value : </td><td class="text-left">'+dataTo.poValue+'</td></tr>';
		 * if(customerPoTo.branchTo !=null && customerPoTo.branchTo.branchCode
		 * !=null){ htmlText +='<tr><td class="text-right">Order Released To :
		 * </td><td class="text-left">'+dataTo.branchTo.branchCode+'</td></tr>'; }
		 * htmlText +='<tr><td class="text-right">Order Type : </td><td class="text-left">'+dataTo.orderTypeTo.orderTypeName+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Domain : </td><td class="text-left">'+dataTo.domainTo.domainName+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Billing Address : </td><td class="text-left">'+dataTo.billingAddress+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">DeliveryAddress : </td><td class="text-left">'+dataTo.deliveryAddress+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Terms&Conditions : </td><td class="text-left">'+dataTo.termsAndConditions+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">PaymentTerms : </td><td class="text-left">'+dataTo.paymentTerms+'</td></tr>';
		 * htmlText +='<tr><td class="text-right">Status : </td><td class="text-left">'+dataTo.status.name+'</td></tr>';
		 */
		
		htmlText +='</tbody></table>';
		/*htmlText +='<form method="POST" commandName="callInfo" action="../callInfo/save" class="smart-form">';
//		htmlText +='<hidden path="tblMsoLcoData.id" value="" />';
		htmlText +='<fieldset>';
		htmlText +='<div class="row">';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Call Type :</label> <label class="input"><input	path="callType" id="callType" placeholder="Call Type" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Call Status :</label> <label class="input"><input	path="callstatus" id="callstatus" placeholder="Call Status" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Follow Up :</label> <label class="input"><input	path="followUp" id="followUp" placeholder="Follow Up" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Excelation :</label> <label class="input"><input	path="excelation" id="excelation" placeholder="Excelation" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Excelate To :</label> <label class="input"><input path="excelateTo" id="excelateTo" placeholder="Excelation To" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Query Asked :</label> <label class="input"><input path="quaryAsked" id="quaryAsked" placeholder="Quary Asked" /></label>';
		htmlText +='</section>';
		htmlText +='<section class="col col-3">';
		htmlText +='<label class="label"><span style="color: red;">*</span>Response Given :</label> <label class="input"><input path="responseGiven" id="responseGiven" placeholder="Response" /></label>';
		htmlText +='</section>';
		htmlText +='</div></fieldset>';
		htmlText +='<button type="submit" class="btn btn-primary">Save</button>';
		htmlText +='</form>';*/
		jQuery("#customerDetails").html(htmlText);
	}
	jQuery("#callManagerDetailsModal").modal(); // initializes and invokes show
}