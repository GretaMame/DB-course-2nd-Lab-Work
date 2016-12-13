/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mokykla.UI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import Mokykla.sql.SQLservice;
import java.util.List;
import java.util.LinkedList;
import java.sql.SQLException;
/**
 *
 * @author grma3240
 */
public class UI {
    public void runUI() {
        SQLservice db = new SQLservice();
        BufferedReader buffReader = new BufferedReader(new InputStreamReader(System.in));
        int option =-1;
        
        printOptions();
         while(option != 7) {
             try {
                 option = Integer.parseInt(buffReader.readLine());
                 switch(option) {
                    case 1: addStudent(buffReader, db);
                            break;
                    case 2: searchStudent(buffReader, db);
                            break;
                    case 3: expelStudent(buffReader, db);
                            break;
                    case 4: changeTeachersNumber(buffReader, db);
                            break;
                    case 5: swapStudents(buffReader, db);       
                            break;
                    case 6: printOptions();
                            break;
                    case 7: break;
                    default: System.out.println("Blogas pasirinkimas");
                             break;
                 } 
             } catch(IOException e)
             {
                 System.out.println("Ivyko klaida skaitant ivesti");
             }
         }
         db.closeConnection();
    }
    
    private void printOptions() {
        System.out.println("----Sveiki prisijunge prie mokyklos sistemos----");
        System.out.println("----                  MENIU                 ----");
        System.out.println("[1] - Iregistruoti nauja mokini.");
        System.out.println("[2] - Ieskoti duomenu apie mokini.");
        System.out.println("[3] - Ismesti mokini is mokyklos.");
        System.out.println("[4] - Pakeisti mokytojo telefono numeri.");
        System.out.println("[5] - Sukeisti mokiniu klases vietomis.");
        System.out.println("[6] - Rodyti meniu is naujo.");
        System.out.println("[7] - Iseiti is sistemos.");
        System.out.println("------------------------------------------------");
    }
    
    private void addStudent(BufferedReader buffRead, SQLservice db) {
        List<List> result = new LinkedList<List>();
        try {
            result = db.queryDB("SELECT * FROM grma3240.Mokiniu_skaicius");
            System.out.println("Klase | Mokiniu skaicius");
            for (int i = 0; i < result.size(); i++) {
                System.out.println(" " + result.get(i).get(0)+ "    | " + result.get(i).get(1));
            }
            System.out.println("Pasirinkite i kuria klase norite iregistruoti mokini");
            String klase = buffRead.readLine();
            String butoNr;
            System.out.println("\nIveskite mokinio varda, pavarde,"+
                    "tevo/globejo varda, pavarde, kontaktini telefono numeri "
            +"bei gyvenamosios vietos adresa(gatve, namas, butas)\n:"); 
            String query = "INSERT INTO grma3240.Mokinys VALUES (DEFAULT,'"+ 
                    buffRead.readLine() +"','" + buffRead.readLine() + "','" + klase+ 
                    "','"+ buffRead.readLine()+ "','" + buffRead.readLine() + "','" + 
                    buffRead.readLine() + "','" + buffRead.readLine() + "'," +
                    buffRead.readLine() + "," + ((butoNr = buffRead.readLine()).isEmpty()? "null": butoNr) + ")";
            System.out.println(query);
            db.updateDB(query);
            System.out.println("Mokinys sekmingai iterptas!");
            printEnding();
        } catch (Exception e) {
            System.out.println("Ivyko klaida: \n" + e.toString());
        }
    }
    
    private void searchStudent(BufferedReader buffRead, SQLservice db) {
        List<List> result;
        List<List> subjects;
        List<List> average;
        System.out.println("Iveskite mokinio varda ir pavarde:");
        try {
            result = db.queryDB("SELECT Nr,Klase FROM grma3240.Mokinys"+
                    " WHERE Vardas ='"+ buffRead.readLine() +"' AND Pavarde ='"+
                    buffRead.readLine()+"'");
            if (!result.isEmpty()) {
                for(int i = 0; i < result.size(); i++) {
                    System.out.println("Mokinio nr.: " + result.get(i).get(0));
                    System.out.println("Kase: " + result.get(i).get(1));
                    System.out.println("Dalykai, kuriuos mokosi:");
                    subjects = db.queryDB("SELECT A.Pavadinimas, B.Pazymys "
                            + "FROM grma3240.Dalykas A, grma3240.Mokymasis B "
                            + "WHERE B.Mokinio_nr="+ result.get(i).get(0) +
                            " AND A.Nr = B.Dalyko_nr");
                    for(int j = 0; j < subjects.size(); j++) {
                        System.out.println(subjects.get(j).get(0)+
                                "\tPazymys: " + subjects.get(j).get(1));
                    }
                    average = db.queryDB("SELECT Vidurkis from grma3240.Mokinio_vidurkis"
                            + " WHERE Nr = " + result.get(i).get(0));
                    System.out.println("Vidurkis: "+average.get(0).get(0));
                }
                System.out.println("\nOperacija ivykdyta sekmingai.");
                printEnding();
            } else {
                System.out.println("\nMokinys su tokiu vardu ir pavarde neegzistuoja.");
                 printEnding();
            }
        } catch(Exception e) {
            System.out.println("\nIvyko klaida: \n" + e.toString());
        }
    }
    
    private void changeTeachersNumber(BufferedReader buffRead, SQLservice db) {
        List<List> display;
        try {
            display = db.queryDB("SELECT * FROM grma3240.Mokytojas");
            System.out.println("----                                      Mokytojai                                     ----");
            System.out.println("|Nr |     Vardas    |       Pavarde      | Telefono nr| Mokslo Istaiga|    Kvalifikacija   |");
            for(int i = 0; i < display.size(); i++) {
                System.out.println("|"+String.format("%1$3s", display.get(i).get(0))+
                        "|"+display.get(i).get(1)+
                        "|"+display.get(i).get(2)+
                        "|"+display.get(i).get(3)+
                        "|"+display.get(i).get(4)+
                        "|"+display.get(i).get(5)+ "|");
            }
            System.out.println("\nIveskite mokytojo, kurio tel. nr. norite keisti, numeri:");
            String nr = buffRead.readLine();
            System.out.println("Iveskite nauja telefono numeri:");
            db.updateDB("UPDATE grma3240.Mokytojas SET Telefono_nr = '"+
                    buffRead.readLine() +"' WHERE Nr = "+ nr);
            System.out.println("\nNumeris pakeistas sekmnigai.");
            printEnding();
        } catch (Exception e) {
            System.out.println("Ivyko klaida:\n" + e.toString());
        }
    }
    
    private void expelStudent(BufferedReader buffRead, SQLservice db) {
        List<List> display;
        try {
            display = db.queryDB("SELECT * FROM grma3240.Mokinys");
            System.out.println("----                                              Mokiniai                               "
                    + "                                     ----");
            System.out.println("|Nr |     Vardas    |       Pavarde      |Klase|Globejo/tevo vardas|Globejo/tevo pavarde|"
                    + " Telefono nr|     Gatve     |Namas|Butas|");
            for(int i = 0; i < display.size(); i++) {
                System.out.println("|"+String.format("%1$3s", display.get(i).get(0))+
                        "|"+display.get(i).get(1)+
                        "|"+display.get(i).get(2)+
                        "|"+String.format("%1$5s", display.get(i).get(3))+
                        "|"+String.format("%1$19s", display.get(i).get(4))+
                        "|"+display.get(i).get(5)+
                        "|"+display.get(i).get(6)+
                        "|"+display.get(i).get(7)+
                        "|"+String.format("%1$5s", display.get(i).get(8))+
                        "|"+String.format("%1$5s", display.get(i).get(9))+"|");
            }
            System.out.println("\nIveskite mokinio, kuri norite pasalinti, numeri:");
            db.updateDB("DELETE FROM grma3240.Mokinys WHERE Nr = "+ buffRead.readLine());
            System.out.println("\nMokinys pasalintas sekmingai.");
            printEnding();
        } catch (Exception e) {
            System.out.println("Ivyko klaida:\n" + e.toString());
        }    
    }
    
    private void swapStudents(BufferedReader buffRead, SQLservice db) {
        List<List> display;
        try {
            display = db.queryDB("SELECT Nr, Vardas, Pavarde, Klase "
                    + "FROM grma3240.Mokinys ORDER BY 1");
            System.out.println("----               Mokiniai                 ----");
            System.out.println("|Nr |     Vardas    |       Pavarde      |Klase|");
            for(int i = 0; i < display.size(); i++) {
                System.out.println("|"+String.format("%1$3s", display.get(i).get(0))+
                        "|"+display.get(i).get(1)+
                        "|"+display.get(i).get(2)+
                        "|"+String.format("%1$5s", display.get(i).get(3))+"|");
            }
            System.out.println("Iveskite mokiniu, kuriuos norite sukeisti vietomis, numerius");
            String nr1 = buffRead.readLine();
            String nr2 = buffRead.readLine();
            int index1 = -1;
            int index2 = -1;
            String current;
            for(int i =0; i< display.size(); i++) {
                current = (String)display.get(i).get(0);
                if (current.equals(nr1)){
                    index1 = i;
                } else {
                    if (current.equals(nr2)){
                    index2 = i;  
                    }
                }
            }
            String klase1 = (String)display.get(index1).get(3);
            String klase2 = (String)display.get(index2).get(3);
            if (index1 != -1 && index2 != -1){
                String query1 = "UPDATE grma3240.Mokinys SET Klase = '" +klase2 + "' WHERE "
                        + "Nr = "+ nr1;
                String query2 ="UPDATE grma3240.Mokinys SET Klase = '" +klase1 + "' WHERE "
                      + "Nr = "+ nr2;
                LinkedList<String> queries = new LinkedList<String>();
                queries.add(query1);
                queries.add(query2);
                try {
                    db.updateNoAutoCommitDB(queries);
                    System.out.println("Mokiniai sekmingai sukeisti.");
                    printEnding();
                } catch(SQLException e) {
                    System.out.println("Mokiniu sukeisti nepavyko.");
                    System.out.println("Klaida: "+ e.toString());
                }
            }
        } catch (IOException e) {
            System.out.println("Ivyko klaida nuskaitant duomenis:\n"+ e.toString());
        } catch(Exception e) {
            System.out.println("Ivyko klaida:\n" + e.toString());
        }
    }
    
    private void printEnding() {
        System.out.println("\nPasirinkite operacija."
                        + "\n(Jei norite pamatyti meniu, spauskite 6)");
    }
}