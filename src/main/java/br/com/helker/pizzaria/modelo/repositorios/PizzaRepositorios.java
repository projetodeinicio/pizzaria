package br.com.helker.pizzaria.modelo.repositorios;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.helker.pizzaria.modelo.entidades.Pizza;
import br.com.helker.pizzaria.modelo.entidades.Pizzaria;

@Repository
public interface PizzaRepositorios extends CrudRepository<Pizza, Long> {

    public List<Pizza> findAllByDono(Pizzaria dono);
	
	public Pizza findByIdAndDono(Long id, Pizzaria dono);
	
	List<Pizza> findAll(Sort sort);
}
