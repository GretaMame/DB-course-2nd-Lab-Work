/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mokykla.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.LinkedList;
/**
 *
 * @author grma3240
 */
public class SQLservice {
    private final String dbURL = "jdbc:postgresql://pgsql2.mif/studentu";
    private final String dbUsername ="grma3240";
    private final String dbPassword ="grma3240";
    private Connection postGresConn = null;
    public SQLservice() {    
        loadDriver();
        getConnection();
    }
    
    private void loadDriver() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Could not find driver class.");
            System.exit(1);
        }
    }
    
    private void getConnection() {
        try {
            postGresConn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        } catch (SQLException e) {
            System.out.println("Could not connect to database.");
            System.exit(1);
        }
    }
    
    public void closeConnection() {
        try {
            postGresConn.close();
        } catch (SQLException e) {
            System.out.println("Error occured while closing connection to database");
        }
    }
    
    public List<List> queryDB(String query) throws Exception{
        Statement st =null;
        ResultSet res = null;
        List<List> result = new LinkedList<List>();
        try {
            st = postGresConn.createStatement();
            res = st.executeQuery(query);
            while (res.next()) {
                List<String> row = new LinkedList<String>();
                for (int i = 1; i < res.getMetaData().getColumnCount()+1; i++) {
                    row.add(res.getString(i));
                }
                result.add(row);
            }
        } catch(SQLException e) {
            System.out.println("Vidine klaida: Nepavyko ivykdyti uzklausos");
            System.out.println(e.toString());
        } finally {
            try {
                if (res != null) {
                    res.close();
                }
                if (st != null) {
                    st.close();
                }
            } catch (SQLException e) {
                System.out.println("Vidine klaida: Ivyko nenumatyta SQL klaida.");
            }
        }
        return result;
    }
    
    public void updateDB(String query) throws SQLException{
        Statement st = null;
        int count = -1;
        try {
            st = postGresConn.createStatement();
            count = st.executeUpdate(query);
        } catch (SQLException e) {
            throw e;
        } finally {
            try {
                if (st != null) {
                st.close();
                }
            } catch (SQLException e) {
                System.out.println("Vidine klaida: nenumatyta SQL klaida");
                System.out.println(e.toString());
                throw e;
            }
            
        }
    }
    
    public void updateNoAutoCommitDB(LinkedList<String> queries) throws SQLException {
        Statement st = null;        
        try {
            postGresConn.setAutoCommit(false);
            st = postGresConn.createStatement();
            for(String query : queries){
                st.executeUpdate(query);   
            }
            postGresConn.commit();
            postGresConn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                postGresConn.rollback();
                postGresConn.setAutoCommit(true);
                throw e;
            } catch (SQLException e1) {
                System.out.println("Vidine klaida: nenumatyta SQL klaida.");
                System.out.println(e1.toString());
            }
        } finally {
            try {
                if(st != null) st.close();
            } catch (SQLException e) {
                System.out.println("Vidine klaida: nenumatyta SQL klaida.");
                System.out.println(e.toString());
            }
        }
        
    }
}