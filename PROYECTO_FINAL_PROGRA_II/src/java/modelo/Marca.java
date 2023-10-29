/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Luis Zambrano
 */
public class Marca {
    
    
    private String marca;
    private int idmarca;
    private Conexion cn;

    public Marca() {}
    public Marca(int idmarca, String marca) {
        this.idmarca = idmarca;
        this.marca = marca;
    }
    
    
 public int getIdmarca() {
        return idmarca;
    }

    public void setIdmarca(int idmarca) {
        this.idmarca = idmarca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
    public DefaultTableModel leer(){
    
    DefaultTableModel tabla = new DefaultTableModel();
    
    try{
    
        cn = new Conexion();
        cn.abrir_conexion();
        
        String query = "SELECT * FROM db_empresa2.marcas;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id","Marca"};
        tabla.setColumnIdentifiers(encabezado);
        String datos [] = new String [2];
        while (consulta.next()){
        
            datos[0] = consulta.getString("idmarca");
            datos[1] = consulta.getString("marca");
            tabla.addRow(datos);
        
        }
        
        cn.cerrar_conexion();
        
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    
    }
    
    return tabla;
        
    }
    
    
    
    //@Override
 public int agregar(){
     int retorno = 0;
 
     try{
     PreparedStatement parametro;
         cn = new Conexion();
         
         //String query = "INSERT INTO marcas (idmarca, marca) VALUES (?,?);";
         String query = "INSERT INTO `db_empresa2`.`marcas` (`marca`) VALUES (?);";
         
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         parametro.setString(1,getMarca());
         
         retorno = parametro.executeUpdate();
         
         cn.cerrar_conexion();
         
         
     }catch(SQLException ex){
         System.out.println(ex.getMessage());
         retorno = 0;
     }
 return retorno;
 }
         
         
 public int modificar (){
     int retorno = 0;

     try{
     PreparedStatement parametro;
         cn = new Conexion();
         String query = "UPDATE marcas SET marca=? where idmarca = ?;";
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         parametro.setString(1,getMarca());
         parametro.setInt(2,getIdmarca());
         
         retorno = parametro.executeUpdate();
         
         cn.cerrar_conexion();
         
         
     }catch(SQLException ex){
         System.out.println(ex.getSQLState());
         retorno = 0;
     }
 return retorno;
 }
         


 //public String eliminar (){
     public int eliminar (){
     int retorno = 0;
  
     try{         
     PreparedStatement parametro;
         cn = new Conexion();
         String query = "DELETE FROM marcas WHERE idmarca = ?;";
         cn.abrir_conexion();
         parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
         parametro.setInt(1,getIdmarca());
         
         retorno = parametro.executeUpdate();
         cn.cerrar_conexion();   
         
     }catch(SQLException ex){
         System.out.println(ex.getMessage());
         retorno = 0;
         //return ex.getMessage();
     }
 return retorno;
 }
}
