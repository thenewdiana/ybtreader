// JavaScript Document
$(function(){
	
	if($(".examTime").get(0)){
        $(".examTime").each(function(i,e){
            var t = new Date(parseInt($(e).text()));
            var hh = t.getHours();
            var mm = t.getMinutes();
            var ss = t.getSeconds();
            if(hh<10){ hh = '0'+hh;}
            if(mm<10){ mm = '0'+mm;}
            if(ss<10){ ss = '0'+ss;}
            $(e).text(t.getFullYear()+"年"+(t.getMonth()+1)+"月"+t.getDate()+"日 "+hh+":"+mm+":"+ss);
        });
    }
	
	if($(".yyyyMMddHHmm").get(0)){
        $(".yyyyMMddHHmm").each(function(i,e){
            var t = new Date(parseInt($(e).text()));
            var yue = t.getMonth()+1;
            var dd = t.getDate();
            var hh = t.getHours();
            var mm = t.getMinutes();
            var ss = t.getSeconds();
            if(yue<10){ yue = '0'+yue;}
            if(dd<10){ dd = '0'+dd;}
            if(hh<10){ hh = '0'+hh;}
            if(mm<10){ mm = '0'+mm;}
            if(ss<10){ ss = '0'+ss;}
            $(e).text(t.getFullYear()+"-"+yue+"-"+dd+" "+hh+":"+mm);
        });
    }
	
	if($(".mdhm").get(0)){
        $(".mdhm").each(function(i,e){
            var t = new Date(parseInt($(e).text()));
            var hh = t.getHours();
            var mm = t.getMinutes();
            if(hh<10){ hh = '0'+hh;}
            if(mm<10){ mm = '0'+mm;}
            $(e).text((t.getMonth()+1)+"-"+t.getDate()+" "+hh+":"+mm);
        });
    }
	
	if($(".interceptString")){
		$(".interceptString").each(function(i,e){
			var data = $(e).text();
			var length = $(e).attr("datalength");
			if(length<data.length){
				var returnString = data.substr(0,length);
				$(e).text(returnString+"...");
			}
        });
	}
	
	if($(".interceptStringno")){
		$(".interceptStringno").each(function(i,e){
			var data = $(e).text();
			var length = $(e).attr("datalength");
			if(length<data.length){
				var returnString = data.substr(0,length);
				$(e).text(returnString);
			}
        });
	}
	
	
});