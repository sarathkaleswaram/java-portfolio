package com.projectMatrix.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.projectMatrix.dao.ClientDao;
import com.projectMatrix.dao.ClientVerticalDao;
import com.projectMatrix.mapper.ClientToClientToMapper;
import com.projectMatrix.mapper.ClientToToClientMapper;
import com.projectMatrix.mapper.ClientVerticalToClientVerticalToMapper;
import com.projectMatrix.model.Client;
import com.projectMatrix.model.ClientVertical;
import com.projectMatrix.to.ClientTo;
import com.projectMatrix.to.ClientVerticalTo;

@Controller
public class ClientController {

	@Autowired
	ClientDao clientDao;
	@Autowired
	ClientToClientToMapper clientToClientToMapper;
	@Autowired
	ClientVerticalDao clientVerticalDao;
	@Autowired
	ClientVerticalToClientVerticalToMapper clientVerticalToClientVerticalToMapper;
	@Autowired
	ClientToToClientMapper clientToToClientMapper;

/*	@RequestMapping("client.htm")
	public ModelAndView viewReports(Model model) {

		List<ClientTo> clientTos = new ArrayList<ClientTo>();
		List<Client> list = clientDao.getAll();
		for (Client client : list) {
			ClientTo clientTo = new ClientTo();
			clientToClientToMapper.map(client, clientTo);
			clientTos.add(clientTo);
		}
		model.addAttribute("list", clientTos);

		return new ModelAndView("client/client");
	}*/

	// @ModelAttribute("clientVerticalList")
	@RequestMapping("verticalList")
	public @ResponseBody List<ClientVerticalTo> getVerticalList() {

		List<ClientVerticalTo> list = new ArrayList<ClientVerticalTo>();
		List<ClientVertical> all = clientVerticalDao.getAll();

		for (ClientVertical clientVertical : all) {
			ClientVerticalTo clientVerticalTo = new ClientVerticalTo();
			clientVerticalToClientVerticalToMapper.map(clientVertical,
					clientVerticalTo);
			list.add(clientVerticalTo);
		}
		return list;
	}

	//client insert to DB
	@RequestMapping(value = "/tasks/insert/{clientName}/{clientVerticalId}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<Client> addTask(@PathVariable String clientName,
			@PathVariable int clientVerticalId) throws ParseException {

		ClientVertical clientVertical = new ClientVertical();
		clientVertical.setVerticalId(clientVerticalId);
		Client client = new Client();
		client.setClientName(clientName);
		client.setClientVertical(clientVertical);
		clientDao.saveOrUpdate(client);
		return null;

	}

	//update existing client in DB
	@RequestMapping(value = "/tasks/edit/{clientId}/{clientName}/{clientVerticalId}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public @ResponseBody List<Client> editTask(@PathVariable int clientId,
			@PathVariable String clientName, @PathVariable int clientVerticalId)
			throws ParseException {

		Client client = clientDao.getById(clientId);

		client.setClientName(clientName);
		clientDao.saveOrUpdate(client);
		ClientVertical clientVertical = new ClientVertical();
		clientVertical.setVerticalId(clientVerticalId);
		client.setClientVertical(clientVertical);


		clientDao.saveOrUpdate(client);
		return null;
	}
	
	//get client list
	@RequestMapping(value = "clientsList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<ClientTo> getClientList() {
		List<Client> ClientList = new ArrayList<Client>();

		ClientList = clientDao.getAll();


		List<ClientTo> alist = new ArrayList<ClientTo>();

		for (Client client : ClientList) {
			ClientTo clientTo = new ClientTo();
			clientToClientToMapper.map(client, clientTo);
			alist.add(clientTo);
		}
		return alist;
	}
/*
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public @ResponseBody void addclient() {
		Client client = new Client();
		client.setClientName("ankith");
		client.setClientVertical(client.getClientVertical());
		System.out.println(client.getClientVertical());
		clientDao.saveOrUpdate(client);
	}

	@RequestMapping(value = "delete/{clientId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.OK)
	public @ResponseBody void deleteclient(
			@PathVariable("clientId") int clientId, Client client) {
		clientDao.delete(client);
	}

	@RequestMapping(value = "/tasks/edit/{clientId}/{client_name}/{client_vertical}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.OK)
	public @ResponseBody void eidtClient(@PathVariable int clientId,
			@PathVariable String client_name, @PathVariable int client_vertical) {
		Client client = clientDao.getById(clientId);
		System.out.println("name" + client.getClientName());
		client.setClientName(client_name);
		// client.setClientVertical(client.getClientVertical());
		clientDao.saveOrUpdate(client);

		Client byId = clientDao.getById(2);
		byId.setClientName("sdjf");
		clientDao.saveOrUpdate(byId);

	}*/

}
