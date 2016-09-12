package br.com.helker.pizzaria.propertyeditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.helker.pizzaria.modelo.entidades.Permissao;
import br.com.helker.pizzaria.modelo.repositorios.PermissaoRepositorios;

@Component
public class PermissaoPropertyEditors extends PropertyEditorSupport{
	
	@Autowired private PermissaoRepositorios permissaoRepositorios;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		long id = Long.parseLong(text);
		Permissao permissao = permissaoRepositorios.findOne(id);
		setValue(permissao);
	}
	

}
