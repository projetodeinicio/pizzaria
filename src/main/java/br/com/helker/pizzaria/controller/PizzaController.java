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

import br.com.helker.pizzaria.excessoes.PizzaException;
import br.com.helker.pizzaria.modelo.entidades.Ingrediente;
import br.com.helker.pizzaria.modelo.entidades.Pizza;
import br.com.helker.pizzaria.modelo.enumeracoes.CategoriaDePizza;
import br.com.helker.pizzaria.modelo.servicos.ServiceIngrediente;
import br.com.helker.pizzaria.modelo.servicos.ServicePizza;
import br.com.helker.pizzaria.propertyeditors.IngredientePropertyEditors;

@Controller
@RequestMapping("/pizzas")
public class PizzaController {
	
	@Autowired private IngredientePropertyEditors ingredientePropertyEditors;
	@Autowired private ServicePizza servicePizza;
	@Autowired private ServiceIngrediente servicoIngrediente;
	
	@RequestMapping(method=RequestMethod.GET)
	public String listarPizzas(Model model){
		model.addAttribute("pizzas", servicePizza.listar());
		model.addAttribute("categorias", CategoriaDePizza.values());
		model.addAttribute("ingredientes", servicoIngrediente.listar());
		return "pizzas/listagem";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarPizza(@Valid @ModelAttribute Pizza pizza, BindingResult bindingResult,
			Model model){
		if(bindingResult.hasErrors()){
			throw new PizzaException();
		}else{
			servicePizza.salvar(pizza);
		}
		model.addAttribute("pizzas", servicePizza.listar());
		return "pizzas/tabela-pizzas";
	}
	
	@RequestMapping(method=RequestMethod.DELETE, value="/{id}")
	public ResponseEntity<String> deletarPizza(@PathVariable Long id){
		
		try {
			servicePizza.remover(id);
			return new ResponseEntity<String>(HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	@ResponseBody
	public Pizza buscarPizza(@PathVariable Long id){
		Pizza pizza = servicePizza.buscar(id);
		return pizza;
	}
	
	@InitBinder
	public void transformTextInLong(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Ingrediente.class, ingredientePropertyEditors);
	}
	
}
