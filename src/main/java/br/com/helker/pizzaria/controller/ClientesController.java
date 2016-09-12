package br.com.helker.pizzaria.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.helker.pizzaria.excessoes.ClienteException;
import br.com.helker.pizzaria.modelo.entidades.Cliente;
import br.com.helker.pizzaria.modelo.entidades.Pizza;
import br.com.helker.pizzaria.modelo.servicos.ServiceCliente;
import br.com.helker.pizzaria.modelo.servicos.ServicePizza;
import br.com.helker.pizzaria.propertyeditors.PizzaPropertyEditors;

@Controller
@RequestMapping("/clientes")
public class ClientesController {
	
	@Autowired private PizzaPropertyEditors pizzaPropertyEditors;
	@Autowired private ServiceCliente serviceCliente;
	@Autowired private ServicePizza servicePizza;

	
	@RequestMapping(method=RequestMethod.GET)
	public String listarClientes(Model model){
		
		model.addAttribute("clientes", serviceCliente.listar());
		model.addAttribute("pizzas", servicePizza.listar());
		return "clientes/listagem";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarCliente(@Valid @ModelAttribute Cliente cliente, BindingResult bindingResult,
			Model model){
		if(bindingResult.hasErrors()){
			throw new ClienteException();
		}else{
			serviceCliente.salvar(cliente);
		}
		model.addAttribute("clientes", serviceCliente.listar());
		return "clientes/tabela-clientes";
	}
	
	@RequestMapping(method=RequestMethod.DELETE, value="/{id}")
	public ResponseEntity<String> deletarCliente(@PathVariable Long id){
		
		try {
			serviceCliente.remover(id);
			return new ResponseEntity<String>(HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	@ResponseBody
	public Cliente buscarCliente(@PathVariable Long id){
		Cliente cliente = serviceCliente.buscar(id);
		return cliente;
	}
	
	@InitBinder
	public void transformTextInLong(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Pizza.class, pizzaPropertyEditors);
	}
	
}
