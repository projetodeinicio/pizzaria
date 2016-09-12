package br.com.helker.pizzaria.modelo.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.helker.pizzaria.modelo.entidades.Cliente;
import br.com.helker.pizzaria.modelo.entidades.Pizzaria;

@Repository
public interface ClienteRepositorios extends CrudRepository<Cliente, Long> {

    public List<Cliente> findAllByDono(Pizzaria dono);
	
	public Cliente findByIdAndDono(Long id, Pizzaria dono);
	
}
