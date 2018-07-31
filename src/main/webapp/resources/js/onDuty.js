function dur(r) {
	var time1 = document.getElementById("fromDate").value;
	
	var time2 = document.getElementById("toDate").value;
	var d1 = new Date(time1 );
	var d1 = new Date(time2 );
var day=(d2.getTime() - d1.getTime()) 
	alert(day)
 /* var start=document.getElementById("fromTime").value;
	   var end = document.getElementById("toTime").value;
	
	   s = start.split(':');
	   e = end.split(':');
	   min = e[1]-s[1];
	   hour_carry = 0;
	   if(min < 0){
	       min += 60;
	       hour_carry += 1;
	   }
	   hour = e[0]-s[0]-hour_carry;
	   min = ((min/60)*100).toString()
	   diff = hour + ":" + min.substring(0,2);
	 
	   document.getElementById('duration').value = diff;*/
/*	var start_actual_time  =  "01/17/2012 11:20";
	    var end_actual_time    =  "01/18/2012 12:25";

	    start_actual_time = new Date(start_actual_time);
	    end_actual_time = new Date(end_actual_time);

	    var diff = end_actual_time - start_actual_time;

	    var diffSeconds = diff/1000;
	    var HH = Math.floor(diffSeconds/3600);
	    var MM = Math.floor(diffSeconds%3600)/60;

	    var formatted = ((HH < 10)?("0" + HH):HH) + ":" + ((MM < 10)?("0" + MM):MM)
	    alert(formatted);*/
	
		
		
			var gh = dateDiff(time1, time2);
		
			document.getElementById('duration').value = gh;

		}
		String.prototype.toHHMMSS = function() {
			var sec_num = parseInt(this, 10);
			// don't forget the second parm
			var hours = Math.floor(sec_num / 3600);
			// alert(hours);
			var minutes = Math.floor((sec_num - (hours * 3600)) / 60);

			if (hours < 10) {
				hours = "0" + hours;
			}
			if (minutes < 10) {
				minutes = "0" + minutes;
			}

			var time = hours + ':' + minutes;
			return time;
		}
		function dateDiff(time1, time2) {
			var t1 = new Date();
			var parts = time1.split(":");
			t1.setHours(parts[0], parts[1], 0);
			var t2 = new Date();
			parts = time2.split(":");
			t2.setHours(parts[0], parts[1], 0);
			return (parseInt(Math.abs(t1.getTime() - t2.getTime()) / 1000)).toString().toHHMMSS();

		}
		function da(d){
			/*var time1 = document.getElementById("toTime").value;*/
			
			var time2 = document.getElementById("fromTime").value;
			var date1=document.getElementById("fromDate").value;
		/*	var date2=document.getElementById("toDate").value;*/
			var datetime = new Date(date1+' '+time2);

			// format the output
			var month = datetime.getMonth()+1;
			var day = datetime.getDate();
			var year = datetime.getFullYear();

			var hour = this.getHours();
			if (hour < 10)
			    hour = "0"+hour;

			var min = this.getMinutes();
			if (min < 10)
			    min = "0"+min;

			var sec = this.getSeconds();
			if (sec < 10)
			    sec = "0"+sec;

			// put it all togeter
			var dateTimeString = month+'/'+day+'/'+year+' '+hour+':'+min+':'+sec;
			alert(hour+':'+min);
		}
	