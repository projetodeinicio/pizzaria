package br.com.helker.pizzaria.modelo.servicos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.helker.pizzaria.modelo.entidades.Cliente;
import br.com.helker.pizzaria.modelo.entidades.Pizzaria;
import br.com.helker.pizzaria.modelo.repositorios.ClienteRepositorios;

@Service
public class ServiceCliente {
	
	@Autowired private ServicoPizzaria servicoPizzaria; 
	@Autowired private ClienteRepositorios repositorio;
	
	public void salvar(Cliente cliente){
		cliente.setDono(servicoPizzaria.getPizzariaLogada());
		repositorio.save(cliente);
	}
	
	public  Iterable<Cliente> listar(){
		Pizzaria dono = servicoPizzaria.getPizzariaLogada();
		return repositorio.findAllByDono(dono);
	}
	public Cliente buscar(long id){
		Pizzaria dono = servicoPizzaria.getPizzariaLogada();
		return repositorio.findByIdAndDono(id, dono);
	}
	public void remover(long id){
		Cliente cliente = this.buscar(id);
		if(cliente != null) repositorio.delete(cliente);
	}

	/*public List<Cliente> listarTodas() {
		Sort sort = new Sort(Sort.Direction.ASC, "nome");
		
		return repositorio.findAll(sort);
		
	}*/
}
