/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kerim
 */

public class Proizvod {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int id;
    private String naziv;
    private float cijena;
    private String opis;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public float getCijena() {
        return cijena;
    }

    public void setCijena(float cijena) {
        this.cijena = cijena;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Proizvod(Connection con) {
		super();
		this.con = con;
    }
    
    public Proizvod() {}
    
    
    
    public List<Proizvod> dohvatiProizvode(){
        List<Proizvod> proizvodi = new ArrayList<Proizvod>();
        try {
            query = "SELECT * FROM proizvodi";
            pst = this.con.prepareStatement(query);  
            rs = pst.executeQuery();
            while (rs.next()) {
                Proizvod product = new Proizvod();
                product.setId(rs.getInt("id"));
                product.setNaziv(rs.getString("naziv"));
                product.setOpis(rs.getString("opis"));
                product.setCijena(rs.getFloat("cijena"));
                proizvodi.add(product);
            }
        }catch(Exception e) {
            
        };
        return proizvodi;
    }
    
    public List<Proizvod> getKorpaProducts(ArrayList<Proizvod> korpaList) {
        List<Proizvod> proizvodi = new ArrayList<Proizvod>();
        
        try {
            if(korpaList.size() > 0) {
                for(Proizvod pr:korpaList) {
                    String query = "SELECT * FROM proizvodi WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, pr.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Proizvod product = new Proizvod();
                        product.setId(rs.getInt("id"));
                        product.setNaziv(rs.getString("naziv"));
                        product.setOpis(rs.getString("opis"));
                        product.setCijena(rs.getFloat("cijena"));
                        proizvodi.add(product);
                    }
                }
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return proizvodi;
    }
    
    public float getKorpaTotal(ArrayList<Proizvod> korpaList) {
        float sum = 0;
        
        try {
            if(korpaList.size() >0){
                for(Proizvod pr:korpaList) {
                    query = "SELECT cijena FROM proizvodi WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, pr.getId());
                    rs = pst.executeQuery();
                    
                    while(rs.next()) {
                        sum+=rs.getFloat("cijena");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return sum;
    }
}
