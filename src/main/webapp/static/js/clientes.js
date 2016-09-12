$(document).ready(function(){
	
});	

$('#btn-salvar').on('click', function(){
	var url = 'clientes';
	var dadosCliente = $('#form-cliente').serialize();
	
	$.post(url, dadosCliente)
	.done(function(pagina){
		$('#sessao-clientes').html(pagina);
		aplicarListeners();
	})
	.fail(function(){
		alert('Erro ao Salvar!');
	}).always(function(){
		$('#modal-cliente').modal('hide');
	});
	
});

var limparModal = function(){
	$('#id').val('');
	$('#nome').val('');
	$('#endereco').val('');
	$('#dataCompra').val('');
	$('#email').val('');
	$('#telefone').val('');
	$('#telefone2').val('');
	$('#preco').val('');
	$('#pizzas option').attr('selected', false);
};
	

	var aplicarListeners = function(){
		$('#modal-cliente').on('hide.bs.modal', limparModal);
		
		$('.btn-deletar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			var csrf = $('#_csrf').val();
			
			$.ajax({
				url : "clientes/"+id,
				type: 'DELETE',
				headers: {'X-CSRF-TOKEN': csrf },
				success: function(result){
					$('tr[data-id="'+id+'"]').remove();
					var clientes = parseInt( $('#qtd-cliente').text() );
					$('#qtd-cliente').text(clientes - 1);
				}
			});
		});
	
		$('.btn-editar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			var url = "clientes/"+id;
			
			$.get(url)
			.success(function(cliente){
				$('#id').val(cliente.id);
				$('#nome').val(cliente.nome);
				$('#endereco').val(cliente.endereco);
				$('#dataCompra').val(cliente.dataCompra);
				$('#email').val(cliente.email);
				$('#telefone').val(cliente.telefone);
				$('#telefone2').val(cliente.telefone2);
				$('#preco').val(cliente.preco);
				
				cliente.pizzas.forEach(function(pizza){
					var id = pizza.id;
					$('#pizzas option[value='+id+']').attr('selected', true);
				});
				
				$('#modal-cliente').modal('show');
			});
				
		});

	}
	
	$(function() {
	    $("#dataCompra").datepicker({
	        dateFormat: 'dd/mm/yy',
	        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
	        dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
	        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
	        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
	        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
	    });
	});

	$(document).ready(function(){
		   $(".btn-deletar").click( function(event) {
		      var apagar = confirm('Deseja realmente excluir este registro?');
		      if (apagar){
		    	 
		      }else{
		         event.preventDefault();
		      }	
		   });
		});
	


