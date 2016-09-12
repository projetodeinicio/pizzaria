package br.com.helker.pizzaria.propertyeditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.helker.pizzaria.modelo.entidades.Ingrediente;
import br.com.helker.pizzaria.modelo.repositorios.IngredienteRepositorios;

@Component
public class IngredientePropertyEditors extends PropertyEditorSupport{
	
	@Autowired private IngredienteRepositorios ingredienteRepositorios;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		long idIngrediente = Long.parseLong(text);
		Ingrediente ingrediente = ingredienteRepositorios.findOne(idIngrediente);
		setValue(ingrediente);
	}

}
