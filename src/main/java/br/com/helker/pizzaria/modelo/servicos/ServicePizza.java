package br.com.helker.pizzaria.modelo.servicos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import br.com.helker.pizzaria.modelo.entidades.Pizza;
import br.com.helker.pizzaria.modelo.entidades.Pizzaria;
import br.com.helker.pizzaria.modelo.repositorios.PizzaRepositorios;

@Service
public class ServicePizza {
	
	@Autowired private ServicoPizzaria servicoPizzaria; 
	@Autowired private PizzaRepositorios repositorio;
	
	public void salvar(Pizza pizza){
		pizza.setDono(servicoPizzaria.getPizzariaLogada());
		repositorio.save(pizza);
	}
	
	public  Iterable<Pizza> listar(){
		Pizzaria dono = servicoPizzaria.getPizzariaLogada();
		return repositorio.findAllByDono(dono);
	}
	public Pizza buscar(long id){
		Pizzaria dono = servicoPizzaria.getPizzariaLogada();
		return repositorio.findByIdAndDono(id, dono);
	}
	public void remover(long id){
		Pizza pizza = this.buscar(id);
		if(pizza != null) repositorio.delete(pizza);
	}

	public List<Pizza> listarTodas() {
		Sort sort = new Sort(Sort.Direction.ASC, "nome");
		
		return repositorio.findAll(sort);
		
	}
}
