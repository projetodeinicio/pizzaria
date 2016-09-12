$(document).ready(function(){
	
	aplicarListeners();
	
});	

$('#btn-salvar').on('click', function(){
	var url = 'pizzas';
	var dadosPizza = $('#form-pizza').serialize();
	
	$.post(url, dadosPizza)
	.done(function(pagina){
		$('#sessao-pizzas').html(pagina);
		aplicarListeners();
	})
	.fail(function(){
		alert('Erro ao Salvar!');
	}).always(function(){
		$('#modal-pizza').modal('hide');
	});
	
});

var limparModal = function(){
	$('#id').val('');
	$('#nome').val('');
	$('#preco').val('');
	$('#categoria').val('');
	$('#ingredientes option').attr('selected', false);
};
	

	var aplicarListeners = function(){
		$('#modal-pizza').on('hide.bs.modal', limparModal);
		
		$('.btn-deletar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			var csrf = $('#_csrf').val();
			
			$.ajax({
				url : "pizzas/"+id,
				type: 'DELETE',
				headers: {'X-CSRF-TOKEN': csrf },
				success: function(result){
					$('tr[data-id="'+id+'"]').remove();
					var pizzas = parseInt( $('#qtd-pizza').text() );
					$('#qtd-pizza').text(pizzas - 1);
				}
			});
		});
	
		$('.btn-editar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			var url = "pizzas/"+id;
			
			$.get(url)
			.success(function(pizza){
				$('#id').val(pizza.id);
				$('#nome').val(pizza.nome);
				$('#preco').val(pizza.preco);
				$('#categoria').val(pizza.categoria);
				
				pizza.ingredientes.forEach(function(ingrediente){
					var id = ingrediente.id;
					$('#ingredientes option[value='+id+']').attr('selected', true);
				});
				
				$('#modal-pizza').modal('show');
			});
				
		});

	}
	
	


