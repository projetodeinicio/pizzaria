package br.com.helker.pizzaria.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.helker.pizzaria.excessoes.PizzariaException;
import br.com.helker.pizzaria.modelo.entidades.Permissao;
import br.com.helker.pizzaria.modelo.entidades.Pizzaria;
import br.com.helker.pizzaria.modelo.servicos.ServicePermissao;
import br.com.helker.pizzaria.modelo.servicos.ServicePizza;
import br.com.helker.pizzaria.modelo.servicos.ServicoPizzaria;
import br.com.helker.pizzaria.propertyeditors.PermissaoPropertyEditors;

@Controller
@RequestMapping("/pizzarias")
public class PizzariaController {
	
	@Autowired private PermissaoPropertyEditors permissaoPropertyEditors;
	@Autowired private ServicePermissao servicePermissao;
	@Autowired private ServicoPizzaria servicoPizzaria;
	@Autowired private ServicePizza servicoPizza;

	
	@RequestMapping(method=RequestMethod.GET)
	public String listarPizzarias(Model model){
		model.addAttribute("pizzarias", servicoPizzaria.listar());
		model.addAttribute("permissoes", servicePermissao.listar());
		return "pizzarias/listagem";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarPizzaria(@Valid @ModelAttribute Pizzaria pizzaria, BindingResult bindingResult,
			Model model){
		if(bindingResult.hasErrors()){
			throw new PizzariaException();
		}else{
			servicoPizzaria.salvar(pizzaria);
		}
		model.addAttribute("pizzarias", servicoPizzaria.listar());
		return "pizzarias/tabela-pizzarias";
	}
	
	@InitBinder
	public void transformTextInLong(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Permissao.class, permissaoPropertyEditors);
	}
	
}
