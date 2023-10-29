package modelo;
// @author Bryan Recinos
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Usuario {
    
    private int idUsuarios;
    private String Usuario, Contrasena;
    private Conexion cn;
  
    
    public Usuario(){}

    public Usuario(int idUsuarios, String Usuario, String Contrasena) {
        this.idUsuarios = idUsuarios;
        this.Usuario = Usuario;
        this.Contrasena = Contrasena;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }
    
public int validar() throws SQLException{

    int rspta=0;
    String query;
    query = "SELECT COUNT(idUsuarios) AS cantidad FROM `usuarios` WHERE Usuario='"+getUsuario()+"' AND Contrasena='"+getContrasena()+"'";
            cn = new Conexion();
            cn.abrir_conexion();
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    while(consulta.next()){
    rspta=consulta.getInt("cantidad");
        
    }
    cn.cerrar_conexion();
    
    
    return rspta;
}   

}
