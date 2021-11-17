/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kerim
 */
public class Narudzbe {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public Narudzbe(Connection con) {
        super();
        this.con = con;
    }
    
    public boolean insertNarudzba(NarudzbaModel model) {
        boolean result = false;
        
        try {
            
            query = "INSERT INTO narudzbe (proizvodi, total_cijena, status, n_date, user_id) VALUES(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, model.getProizvodi());
            pst.setFloat(2, model.getTotal_cijena());
            pst.setInt(3, model.getStatus());
            pst.setString(4, model.getDate());
            pst.setInt(5, model.getUser_id());
            pst.executeUpdate();
            result = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public List<NarudzbaModel> userNarudzbe(int id) {
        List<NarudzbaModel> list = new ArrayList<NarudzbaModel>();
        
        try {
            query = "SELECT * FROM narudzbe WHERE user_ID=? ORDER BY narudzbe.status ASC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                NarudzbaModel narudzba = new NarudzbaModel();
                
                narudzba.setNarudzbaID(rs.getInt("narudzba_id"));
                narudzba.setProizvodi(rs.getString("proizvodi"));
                narudzba.setTotal_cijena(rs.getFloat("total_cijena"));
                narudzba.setStatus(rs.getInt("status"));
                narudzba.setDate(rs.getString("n_date"));
                narudzba.setUser_id(rs.getInt("user_id"));
                
                list.add(narudzba);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<NarudzbaModel> sveNarudzbe() {
        List<NarudzbaModel> list = new ArrayList<NarudzbaModel>();
        
        try {
            query = "SELECT * FROM narudzbe ORDER BY narudzbe.status ASC";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                NarudzbaModel narudzba = new NarudzbaModel();
                
                narudzba.setNarudzbaID(rs.getInt("narudzba_id"));
                narudzba.setProizvodi(rs.getString("proizvodi"));
                narudzba.setTotal_cijena(rs.getFloat("total_cijena"));
                narudzba.setStatus(rs.getInt("status"));
                narudzba.setDate(rs.getString("n_date"));
                narudzba.setUser_id(rs.getInt("user_id"));
                list.add(narudzba);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public void odobriNarudzbu(int id) {
        try {
            query = "UPDATE narudzbe SET status = 1 WHERE narudzba_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public void ponistiNarudzbu(int id) {
        try {
            query = "UPDATE narudzbe SET status = 2 WHERE narudzba_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
