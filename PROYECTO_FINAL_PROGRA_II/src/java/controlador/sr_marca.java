package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Marca;

public class sr_marca extends HttpServlet {
    
    Marca marca;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use the following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_marca</title>");
            out.println("</head>");
            out.println("<body>");
            
            marca = new Marca(Integer.valueOf(request.getParameter("txt_id")), request.getParameter("txt_marcas"));
            
            // Boton Agregar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (marca.agregar() > 0) {
                    response.sendRedirect("index4.jsp");
                } else {
                    out.println("<h1>xxxxxxxxxxx NO SE INGRESÓ LA MARCA xxxxxxxxxxx</h1>");
                    out.println("<a href='index.jsp'>Regresar</a>");
                }
            }
            
            // Boton Modificar
            if ("modificar".equals(request.getParameter("btn_modificar"))){
                if (marca.modificar()>0){
                    response.sendRedirect("index.jsp");

                }else{
                    out.println("<h1> xxxxxxxxxxx NO SE MODIFICO xxxxxxxxxxx </h1>");
                    out.println("<a href = 'index.jsp'>Regresar </a>");
                }
                response.getWriter().println("Datos de entrada: "+marca.modificar());
            }
            
            if ("eliminar".equals(request.getParameter("btn_eliminar"))){
            if (marca.eliminar()>0){
            response.sendRedirect("index.jsp");
                
            }else{
            out.println("<h1> xxxxxxxxxxx NO SE ELIMINO xxxxxxxxxxx </h1>");
            out.println("<a href = 'index.jsp'>Regresar </a>");
            }
            
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
