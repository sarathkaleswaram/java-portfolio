$( document ).ready(function() {
	jQuery('.datepicker').datepicker({
	    format : 'dd/mm/yyyy',
	    changeMonth: true,
	    changeYear: true,
	    autoclose : true
	});
	var str =  document.getElementById("updatedweekoff");
	getstr(str.value); 
});

$(function() {
    $("#uploadFile").on("change", function()
    {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
 
        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
 
            reader.onloadend = function(){ // set image data as background of div
                $("#imagePreview").css("background-image", "url("+this.result+")");
            }
        }
    });
});

$(function() {
	 $("#fromDate").on("change", function(){
		 if(this.id == 'fromDate'){
	            var ContractTerm = 1;
	            var dateMin = $('#fromDate').datepicker("getDate");
	            var rMax = new Date((dateMin.getFullYear()) + parseInt(ContractTerm), dateMin.getMonth(),dateMin.getDate() - 1); 
	            $('#toDate').val($.datepicker.formatDate('dd/mm/yy', new Date(rMax)));  
	        }
	    });
	});


function getstr(getstrvalue)
{
var str = getstrvalue;
var sel = str.split(",");
options = document.getElementById("weekoffs").getElementsByTagName("option"); 
for(var i in options) 
  for(var j in sel)
        if(options[i].innerHTML == sel[j])
            options[i].selected="selected";
}