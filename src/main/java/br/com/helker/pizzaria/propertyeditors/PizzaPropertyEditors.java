package br.com.helker.pizzaria.propertyeditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.helker.pizzaria.modelo.entidades.Pizza;
import br.com.helker.pizzaria.modelo.repositorios.PizzaRepositorios;

@Component
public class PizzaPropertyEditors extends PropertyEditorSupport{
	
	@Autowired private PizzaRepositorios pizzaRepositorios;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		long id = Long.parseLong(text);
		Pizza pizza = pizzaRepositorios.findOne(id);
		setValue(pizza);
	}

}
