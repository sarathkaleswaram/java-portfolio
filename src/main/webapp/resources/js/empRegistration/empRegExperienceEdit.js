 
var myContextPath="${pageContext.request.contextPath}";
function addLineItem() {
	var tblBody = document.getElementById("poLineItemTable").tBodies[0];
	var newNode = tblBody.rows[0].cloneNode(true);
	var count;
	var count = $('#poLineItemTable tr').length;
	var cells = newNode.cells;
	for (var i = 0; i < cells.length; i++) {
		if (i == 0) {
			cells[i].innerHTML = count;
			cells[1].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].orgName";
			cells[1].firstElementChild.name = "tblEmpExperienceList[" + (count-2) + "].orgName";
			cells[1].firstElementChild.value = "";
			cells[1].lastElementChild.id = "tblEmpExperienceList[" + (count -2) + "].empExperienceId";
			 cells[1].lastElementChild.name = "tblEmpExtracurLists[" + (count -2) + "].empExperienceId"; 
			 cells[1].lastElementChild.value= "";
			cells[2].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].fromDate";
			 cells[2].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].fromDate";
			cells[2].firstElementChild.value = "";
			
			cells[3].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].toDate";
			 cells[3].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].toDate";
			cells[3].firstElementChild.value = "";
			
			cells[4].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].joiningDesig";
			 cells[4].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].joiningDesig";
			cells[4].firstElementChild.value = "";
			
			cells[5].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].relDesig";
			 cells[5].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].relDesig";
			cells[5].firstElementChild.value = "";
			
			cells[6].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].reasonForLeaving";
			 cells[6].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].reasonForLeaving";
			cells[6].firstElementChild.value = "";
			
			cells[7].firstElementChild.id = "tblEmpExperienceList[" + (count-2) + "].remarks";
			 cells[7].firstElementChild.name  = "tblEmpExperienceList["+(count-2)+"].remarks";
			cells[7].firstElementChild.value = "";
			
			
			cells[8].firstElementChild.id = "";
		}
		tblBody.appendChild(newNode);
		}
}

 function deleteRow(t)
{
	var rowId = t.parentNode.parentNode.rowIndex;
	console.log(rowId);
    var row = t.parentNode.parentNode;
    console.log("row+"+$(t)[0].id)
    if($(t)[0].id !=0){
	   var idd = $(t)[0].id;
	   console.log("id"+idd)
 	
 	   
		jQuery.ajax({
			type : "GET",
			data : {
				id : idd,
			},

			url : myContextPath + '/experience/delete',
			success : function(response) {
				location.reload(true);
			}
		});
    }       
    console.log("row",parseInt(row.id))
    if(row.rowIndex != 2) {
        document.getElementById("poLineItemTable").deleteRow(row.rowIndex);
	        var count = parseInt(document.getElementById("rowCount").value) - 1;
	        document.getElementById("rowCount").value = count;
    }

    var table = document.getElementById('poLineItemTable');

    var rowLength = table.rows.length;
    var xx= parseInt(row.id);
    var i=xx+2;

for(var i=2; i<=rowLength; i+=1){
  var row;
   row = table.rows[i];
  if(i==rowLength){
 	  row = table.rows[i-1];
        }
  
//   cells[i].innerHTML = i-1;
  
 
  row.cells[1].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].orgName";
	row.cells[1].firstElementChild.name = "tblEmpExperienceList[" + (i-2) + "].orgName";
  row.cells[1].lastElementChild.id = "tblEmpExperienceList[" + (i -2) + "].empExperienceId";
  row.cells[1].lastElementChild.name = "tblEmpExtracurLists[" + (i -2) + "].empExperienceId"; 
 row.cells[2].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].fromDate";
	row.cells[2].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].fromDate";
 row.cells[3].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].toDate";
	row.cells[3].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].toDate";
 row.cells[4].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].joiningDesig";
	row.cells[4].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].joiningDesig";
 row.cells[5].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].relDesig";
	row.cells[5].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].relDesig";
 row.cells[6].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].reasonForLeaving";
	row.cells[6].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].reasonForLeaving";
 row.cells[7].firstElementChild.id = "tblEmpExperienceList[" + (i-2) + "].remarks";
	row.cells[7].firstElementChild.name  = "tblEmpExperienceList["+(i-2)+"].remarks";
      
 	  if(i==rowLength){
        	  row = table.rows[i-1];
        	row.cells[1].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].orgName";
       row.cells[1].firstElementChild.name = "tblEmpExperienceList[" + (i-3) + "].orgName";
        	  row.cells[1].lastElementChild.id = "tblEmpExperienceList[" + (i-3) + "].empExperienceId";
        	  row.cells[1].lastElementChild.name = "tblEmpExtracurLists[" + (i-3) + "].empExperienceId"; 
        	 row.cells[2].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].fromDate";
        		row.cells[2].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].fromDate";
        	 row.cells[3].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].toDate";
        		row.cells[3].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].toDate";
        	 row.cells[4].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].joiningDesig";
        		row.cells[4].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].joiningDesig";
        	 row.cells[5].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].relDesig";
        		row.cells[5].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].relDesig";
        	 row.cells[6].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].reasonForLeaving";
        		row.cells[6].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].reasonForLeaving";
        	 row.cells[7].firstElementChild.id = "tblEmpExperienceList[" + (i-3) + "].remarks";
        		row.cells[7].firstElementChild.name  = "tblEmpExperienceList["+(i-3)+"].remarks";
        	      
               }
}
} 

