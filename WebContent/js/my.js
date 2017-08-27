$(function(){
	var kong = null;//定义图片自动轮播的空
	var i = 0;//定义每张图片数
	
	$('.oImg2').eq(0).fadeIn(300);//显示照片第一个出来
	
	function tpqh(){ 
		$('.oImg2').eq(i).fadeIn(300).siblings().fadeOut(0);
		$('.div-yuan2').eq(i).addClass('div-yuan1-ys').siblings().removeClass('div-yuan1-ys');
	};//定义图片轮播的出现
	function tplb(){
		clearTimeout( kong );
		kong = setInterval(function(){
			i++;
			if( i == 4){
				i = 0;	
			};
			tpqh();
		},3000);;//定义每隔3秒自动轮播
	}
	tplb();//使用tplb()的定义
	
	
	$('.zuo').click(function(){
		i--; //每按一次减i一次；i开始为0;
		if( i == -1){ //定义i 等于- 1就返回i等于3
			i = 3;	
		};
		tpqh();//使用tplb()的定义
	});//实现按<倒退一张
	$('.you').click(function(){
		i++;//每按一次加i一次；i开始为0;
		if( i == 4){//定义i 等于4 就返回i等于0
			i = 0;	
		};
		tpqh();//使用tplb()的定义
	});//实现按>前进一张
	
	
	$('.zuo').hover(function(){//hover意思是鼠标移入、移除
		clearTimeout( kong );//一开始为空
		$(this).css('background','#9AFF9A')	//颜色改变
	},function(){
		tplb();	//使用tplb()的定义
		$(this).css('background','')//颜色改变回来
	});
	$('.you').hover(function(){//hover意思是鼠标移入、移除
		clearTimeout( kong );;//一开始为空
		$(this).css('background','#9AFF9A')//颜色改变
	},function(){
		tplb();	//使用tplb()的定义
		$(this).css('background','')//颜色改变回来
	});
	
	$('.div-yuan2').hover(function(){//hover意思是鼠标移入、移除
		i = $(this).index();//定义鼠标移入图片轮播下面每一个圆圈
		tpqh();//使用tpqh()的定义
		clearTimeout( kong )//一开始为空
	},function(){
		tplb();	//使用tplb()的定义
	});
	
		
		$('.div1-xz1').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz1-1').show();//出现
		},function(){
			$('.div1-xz1-1').hide();	//消失	
		});		
		
		$('.div1-xz2').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz2-1').show();//出现
		},function(){
			$('.div1-xz2-1').hide();		//消失
		});	
		$('.div1-xz3').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz3-1').show();//出现
		},function(){
			$('.div1-xz3-1').hide();		//消失
		});	
		$('.div1-xz4').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz4-1').show();//出现
		},function(){
			$('.div1-xz4-1').hide();	//消失	
		});	
		$('.div1-xz5').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz5-1').show();//出现
		},function(){
			$('.div1-xz5-1').hide();	//消失
		});	
		$('.div1-xz6').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz6-1').show();//出现
		},function(){
			$('.div1-xz6-1').hide();	//消失
		});	
		$('.div1-xz7').hover(function(){//hover意思是鼠标移入、移除
			$('.div1-xz7-1').show();//出现
		},function(){
			$('.div1-xz7-1').hide();	//消失
		});	
		
		
	
	});