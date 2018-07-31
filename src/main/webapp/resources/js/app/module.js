function applicationOnChange(t){
	 $("#module").empty();
	console.log("appId=="+t);
	var moduleOption
$.ajax({  
     type : "GET",   
     url : "../version/getByAppId",   
     data : "appId=" + $(t).val(),
 	contentType: "application/json; charset=UTF-8",
     success : function(data) {  
    	 console.log(data);
    	 $("#module").append('<option value="0">Please select</option');
    	 data.forEach(function(s) {
    		 $("#module").append('<option value="'+s.moduleId+'">'+s.moduleName+'</option');
    		});
     },  
     error : function(e) {  
      alert('Error: ' + e);   
     }  
    }); 
}