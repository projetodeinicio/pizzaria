package br.com.helker.pizzaria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.helker.pizzaria.modelo.servicos.ServiceCliente;
import br.com.helker.pizzaria.modelo.servicos.ServicePizza;
import br.com.helker.pizzaria.modelo.servicos.ServicoPizzaria;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	//@Autowired private PizzaPropertyEditors pizzaPropertyEditors;
	
	@Autowired private ServiceCliente serviceCliente;
	@Autowired private ServicePizza servicePizza;
	@Autowired private ServicoPizzaria servicePizzaria;

	
	@RequestMapping(method=RequestMethod.GET)
	public String index(Model model){
		model.addAttribute("pizzas", servicePizza.listarTodas());
		
		return "cliente/busca-pizzarias";
		
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/pizza/{nomePizza}")
	public String index(@PathVariable String nomePizza, Model model){
		model.addAttribute("pizzarias", servicePizzaria.listarPizzariasQueContem(nomePizza));
		return "cliente/tabela-pizzaria";
		
	}
	
}
