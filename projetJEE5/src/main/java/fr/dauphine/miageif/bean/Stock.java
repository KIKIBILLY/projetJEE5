package fr.dauphine.miageif.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * @author REZKELLAH
 *
 */
public class Stock {

	private String idPL; // identifiant point de location
	private List<Objet> stockPL = new ArrayList<Objet>(); // list des produit offeres a la location dans le PL

	public String getIdPL() {
		return idPL;
	}

	public void setIdPL(String idPL) {
		this.idPL = idPL;
	}

	public List<Objet> getStockPL() {
		return stockPL;
	}

	public void setStockPL(List<Objet> stockPL) {
		this.stockPL = stockPL;
	}

}
