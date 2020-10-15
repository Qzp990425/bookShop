$(function () {
	//1.处理轮播图
	$(window).on('resize' ,function(){
		/* 1窗口宽度 */
		let clientW = $(window).width();
		//2.设置临界点
		let isShowBigImage = clientW >= 900;
		//3 获取所有的item
		let $allItems = $('#sp_carousel .carousel-item');
		//console.log($allItems) 输出查看
		//4 遍历
		$allItems.each((index,item) => { 
			//console.log(item);
			//4.1取出图片路径
			let src = isShowBigImage ? $(item).data('lg-img'): $(item).data('sm-img');
			let imgUrl = `url(${src})`;
			//4.2设置背景
			$(item).css({
				backgroundImage: imgUrl
			})
			//4.3创建img标签
			if(!isShowBigImage){  //大屏幕
				let imgEle = `<img src="${src}">`;
				$(item).empty().append(imgEle);
			}else{  //小屏幕
				$(item).empty();
			}
		});
	});
	$(window).trigger('resize');//进来之后先执行这个方法
	
	//3.添加轮播图的滑动
	let startX = 0, endX = 0;
	let carouselInner = $('#sp_carousel .carousel-inner')[0];
	let $carousel = $('#sp_carousel');
	let carousel = $carousel[0];
	
	carouselInner.addEventListener('touchstart',(e)=> {
		startX = e.targetTouches.clientX;
	});
	
	carouselInner.addEventListener('touchend',(e)=> {
		endX = e.targetTouches.clientX;
		if(endX - startX > 0){  //上一张
			$carousel.carousel('prev');
		}else if(endX - startX < 0){
			$carousel.carousel('next');
		}
	});
});