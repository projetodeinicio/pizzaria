package br.com.helker.pizzaria.modelo.servicos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import br.com.helker.pizzaria.modelo.entidades.Pizzaria;
import br.com.helker.pizzaria.modelo.repositorios.PizzariaRepositorios;

@Service
public class ServicoPizzaria {
	
	@Autowired private PizzariaRepositorios pizzariaRepositorios;

	public Pizzaria getPizzariaLogada(){
	Authentication autenticado = SecurityContextHolder.getContext().getAuthentication();
	
	if( autenticado == null) throw new AuthenticationCredentialsNotFoundException("Usuario nao logado");
	
		UserDetails usuarioLogado = (UserDetails) autenticado.getPrincipal();
		return pizzariaRepositorios.findOneByLogin( usuarioLogado.getUsername() );
	}
	
	public void salvar(Pizzaria pizzaria){
		pizzariaRepositorios.save(pizzaria);
	}
	
	public  Iterable<Pizzaria> listar(){
		return pizzariaRepositorios.findAll();
	}

	public List<Pizzaria> listarPizzariasQueContem(String nomePizza) {
		return pizzariaRepositorios.listarPizzariaPorNomePizza(nomePizza);
		
	}

}
