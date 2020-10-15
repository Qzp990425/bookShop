$(document).ready(function(){ 
	//验证按钮内容是否大于
	var length = $(".buynum").length;
	console.log(length);
	$(".buynum").blur(function(){	
			for(var i = 0; i<length ; i++){
			var hidbuynum = parseInt($(".hidbuynum").eq(i).val());
			console.log(hidbuynum);
			var buynum = parseInt($(".buynum").eq(i).val());
			console.log(buynum);
			var num = parseInt($(".num").eq(i).val());
			console.log(buynum);
			if (buynum>num) {
				window.alert("库存不足,请重新输入");
				$(".buynum").eq(i).val(hidbuynum);
			}	
		}
	});
	
	$("#cartform").submit(function(event){
		if(length==0){
			alert("请先添加商品");
		    event.preventDefault();
		}
	});
});

