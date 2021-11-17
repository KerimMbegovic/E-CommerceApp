/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.Connection;

/**
 *
 * @author Kerim
 */
public class NarudzbaModel extends Proizvod {
    private int narudzbaID;
    private String proizvodi;
    private float total_cijena;
    private int status;
    private int user_id;
    private String date;
    private Connection con;
    
    public NarudzbaModel(Connection con) {
		super();
		this.con = con;
    }
    
    public NarudzbaModel(){}
    
    public int getNarudzbaID() {
        return narudzbaID;
    }
    
    public void setNarudzbaID(int narudzbaID) {
        this.narudzbaID = narudzbaID;
    }

    public String getProizvodi() {
        return proizvodi;
    }

    public void setProizvodi(String proizvodi) {
        this.proizvodi = proizvodi;
    }

    public float getTotal_cijena() {
        return total_cijena;
    }

    public void setTotal_cijena(float total_cijena) {
        this.total_cijena = total_cijena;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
    
    
}
