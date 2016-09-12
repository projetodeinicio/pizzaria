package br.com.helker.pizzaria.modelo.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.helker.pizzaria.modelo.entidades.Permissao;

@Repository
public interface PermissaoRepositorios extends CrudRepository<Permissao, Long> {

}
