package br.com.helker.pizzaria.modelo.servicos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.helker.pizzaria.modelo.entidades.Permissao;
import br.com.helker.pizzaria.modelo.repositorios.PermissaoRepositorios;

@Service
public class ServicePermissao {
	
	@Autowired private PermissaoRepositorios repositorio;
	
	public  Iterable<Permissao> listar(){
		
		return repositorio.findAll();
	}
}
