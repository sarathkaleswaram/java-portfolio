/**
 * @param receivableId
 */
function showReceivableDetails(receivableId){
	alert("haiiii");
	console.log(receivableId+"iddddd");
        jQuery.ajax
    ({
                    traditional: true,
                            type: "GET",
          
                        url: "../branch/branchPopUp",
                        data:{"receivableId":receivableId},
                        scriptCharset: "utf-8" ,
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data){
            	
            	console.log(data+"haiiiii");
                    showModelDialog(data)
             },
             error: function(){
                     alert('An unexpected error has occurred.');
             }
    });

}

function showModelDialog(data){
	if(data){
		var htmlText = '<table class="table table-striped" id="tblGrid">';
		htmlText +='<tr><td class="text-right">Received Amount : </td><td class="text-left">'+data+'</td></tr>';
		/*if(receivableTo.invoiceTo!=null&&receivableTo.invoiceTo.invoiceNo!==null&&receivableTo.invoiceTo.invoiceNo != '' && receivableTo.invoiceTo.invoiceNo!= '0'){
		htmlText +='<tr><td class="text-right">Invoice No : </td><td class="text-left">'+receivableTo.invoiceTo.invoiceNo+'</td></tr>';
		}
		htmlText +='<tr><td class="text-right">Account : </td><td class="text-left">'+receivableTo.accountTo.name+'</td></tr>';
		if(receivableTo.invoiceTo!=null&&receivableTo.invoiceTo.invoiceTotalAmount!==null&&receivableTo.invoiceTo.invoiceTotalAmount != '' && receivableTo.invoiceTo.invoiceTotalAmount != '0'){
		htmlText +='<tr><td class="text-right">Invoice Amount : </td><td class="text-left">'+receivableTo.invoiceTo.invoiceTotalAmount+'</td></tr>';
		}
		if(receivableTo.receiptNo!=null){
		htmlText +='<tr><td class="text-right">Receipt No : </td><td class="text-left">'+receivableTo.receiptNo+'</td></tr>';
		}
		htmlText +='<tr><td class="text-right">Receipt Date : </td><td class="text-left">'+receivableTo.receiptDate+'</td></tr>';
		htmlText +='<tr><td class="text-right">Receivable Date : </td><td class="text-left">'+receivableTo.recievableDate+'</td></tr>';
		htmlText +='<tr><td class="text-right">Instrument No : </td><td class="text-left">'+receivableTo.instrumentNo+'</td></tr>';
		htmlText +='<tr><td class="text-right">Instrument Date : </td><td class="text-left">'+receivableTo.instrumentDate+'</td></tr>';
		htmlText +='<tr><td class="text-right">Instrument Type : </td><td class="text-left">'+receivableTo.instrumentType.name+'</td></tr>';
		if(receivableTo.invoiceTo !==null && receivableTo.invoiceTo.customerPoTo !=null && receivableTo.invoiceTo.customerPoTo.user !=null ){
		htmlText +='<tr><td class="text-right">Account Manager : </td><td class="text-left">'+receivableTo.invoiceTo.customerPoTo.user.name+'</td></tr>';
		}*/
	/*	htmlText +='<tr><td class="text-right">Delay Factor : </td><td class="text-left">'+receivableTo.delayFactor+'</td></tr>';*/
		htmlText +='</tbody></table>';
		jQuery("#receivableDetails").html(htmlText);
	}
	jQuery("#receivableDetailsModel").modal(); // initializes and invokes show immediately
}

