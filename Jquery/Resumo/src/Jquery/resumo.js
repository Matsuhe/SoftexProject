$(function () {
	// Esta funcao nao funciona mais
	// $('img').error(function(){
	//     $(this).attr("src","src/image/noimage.jpg");
	//     $('img').attr("src","src/image/noimage.jpg");
	// });

	//versao antiga
	// $("img").bind("error",function(){
	//     $(this).attr("src","src/image/noimage.jpg");
	// });

	// versao mais nova
	// $("img").on("error", function() {
	//     $(this).attr("src", "src/image/noimage.jpg");
	// });

	//é um saco isso vou tirar por enquantp

	// $(document).ready(function () {
	//     alert('Dom carregado');
	// });

	// $("img").on("error", function () {
	// 	var imagem = $(this).attr("src");
	// 	alert("Imagem " + imagem + " indisponivel");
	// 	$(this).attr("src", "src/image/noimage.jpg");
	// });

	$(".screenimage > img").width($(window).width()).height($(window).height());
	$(window).resize(function () {
		$(".screenimage > img")
			.width($(window).width())
			.height($(window).height());
	});

	// $(window).scroll(function () {
	// 	$("img").fadeOut("1000");
	// });

	// $("body").css("height", "5000px");

	// $(window).scroll(function () {
	//     var topo = $(window).scrollTop();
	//     alert(topo);
	// });

	$(window).scroll(function () {
		var topo = $(window).scrollTop();
		if (topo > 600) {
			$(".semimagem").fadeOut("1000");
		} else {
			$(".semimagem").fadeIn("1000");
		}
	});

	var ex = $(".exp1");
	$(".exp2").click(function () {
		$(this).css("background", "#ccc");
		ex.text("Você Clicou!");
	});
	$(".exp3").dblclick(function () {
		$(this).css("background", "#ccc");
		ex.text("Você deu dois Cliques!");
	});
	$(".exp4")
		.focusin(function () {
			$(this).css("background", "#ccc");
			ex.text("Você deu Foco!");
		})
		.focusout(function () {
			$(this).css("background", "#000");
			ex.text("Você tirou o Foco!");
		});
	$(".exp5").hover(function () {
		$(this).css("background", "#ccc");
		ex.text("Você Passou o Mouse!");
	});

	$(".exp6")
		.mousedown(function () {
			$(this).css("background", "#ccc");
			ex.text("Você Apertou o Botão do Mouse!");
		})
		.mouseup(function () {
			$(this).css("background", "#000");
			ex.text("Você Soltou o Botão do Mouse!");
		});

	var a = 0;
	$(".exp7")
		.mouseenter(function () {
			a += 1;
			ex.text("Entradas do Mouse: " + a);
		})
		.mouseout(function () {
			ex.text("Saida do Mouse");
		});

	var b = 0;
	$(".exp8")
		.mouseover(function () {
			b += 1;
			ex.text("Mouse over: " + b);
		})
		.mouseleave(function () {
			ex.text("Mouse Leave");
		});

	$(".exp9").mousemove(function (move) {
		var localx = move.pageX;
		var localy = move.pageY;
		ex.text("Movimento X: " + localx + " - Movimento Y: " + localy);
	});

	$(".place").each(function () {
		var place = $(this).attr("title");
		var input = $(this);

		input
			.val(place)
			.css("color", "#ccc")
			.focusin(function () {
				input.css("color", "#000");
				if (input.val() == place) {
					input.val("");
				}
			})
			.focusout(function () {
				if (input.val() == "") {
					input.css("color", "#ccc");
					input.val(place);
				}
			});
	});

	// FUNÇÕES PARA BRINCAR NO AULAS COM TECLADO
	var ex1_1 = $(".exp1_1");
	// $('.key').keypress(function () {
	// 	ex1_1.text($(this).val());
	// });

	// $('.key').keydown(function () {
	// 	ex1_1.text($(this).val());
	// });

	// $('.key').keyup(function () {
	// 	ex1_1.text($(this).val());
	// });

	// $('.ev1').focus(function(){
	// 	ex1_1.text($(this).attr('title'));
	// }).keyup (function(){
	// 	if($(this).val() == 'pontocom') {
	// 		$('.ev2').focus();
	// 	}
	// });

	// $('.ev1').blur(function(){
	// 	ex1_1.text("Saida do campo: "+$(this).attr('name'));
	// });

	// $('.ev1').change(function(){
	// 	ex1_1.text("Campo alterado: "+$(this).val());
	// });

	$(".selBot").click(function () {
		$(".ev3").select();
		$("form").submit(function () {
			return false;
		});
	});

	var ex11 = $(".exp11");
	$(".exp12").click(function () {
		ex11.hide("slow");
	});
	$(".exp13").click(function () {
		ex11.show("slow");
	});
	$(".exp14").click(function () {
		ex11.toggle("slow");
	});

	$('.exp15').keyup (function(){
		var texto = $(this).val();
		if(texto == 'hide') {
			ex11.hide('slow');
		}
		if(texto == 'show') {
			ex11.show('slow');
		}
		if(texto == 'toggle'){
			ex11.toggle('slow');
		}
	});

	var ex111 = $(".exp111");
	var buton = $(".exp112");
	var buton1 = $(".exp113");

	buton.click(function() {
		ex111.fadeOut("slow");
	}).dblclick(function() {
		ex111.fadeIn("slow");
	})
	
	// buton1.click(function() {
	// 	ex111.fadeTo("slow",0.5);
	// })

	// Curiosidade
	// buton1.click(function() {
	// 	ex111.fadeTo("slow",0.5,function() {
	// 		ex111_1.fadeTo("slow",0.5,);
	// 	});
	// });

	buton1.click(function() {
		ex111.fadeToggle("slow");
	});


	//EXTRA FUNCOES: fazer um menu fixo
	// var nav = $('.menu');
	// $(window).scroll(function(){
	// 	if($(this).scrollTop() > 173){
	// 		nav.addClass("menu-fixo");
	// 	}else{
	// 		nav.removeClass("menu-fixo");
	// 	}
	// });

	//EXTRA FUNCOES: fazer um slide
	// $('#slide img: eq(0)').addClass("ativo").show();
	// var texto = $(".ativo").attr("alt");
	// $('#slide').prepend("<p>"+texto+"</p>");
	// setInterval(slide, 3000);
	// function slide(){
	// 	if($('.ativo').next().size()){
	// 		$('.ativo').fadeOut().removeClass("ativo").next().fadeIn().addClass("ativo");
	// 	}else{
	// 		$('.ativo').fadeOut().removeClass("ativo");
	// 		$('#slide img: eq(0)').fadeIn().addClass("ativo");
	// 	}
	// 	var texto = $(".ativo").attr("alt");
	// 	$('#slide p').hide().html(texto).delay(500).fadeIn();
	// }

	//EXTRA FUNÇÕES: efeito sanfona
	// $('.titulo').click(function(){
	// 	var conteudo = $(this).parent().find('.conteudo');
	// 	if(!conteudo.hasClass('show')){
	// 		$('.caixa').find('.show').slideUp('fast', function(){
	// 			$(this).addClass('hide').removeClass('show');
	// 		});
	// 		conteudo.slideDown('fast',function(){
	// 			$(this).addClass('show').removeClass('hide');
	// 		});
	// 	}
	// });

});
