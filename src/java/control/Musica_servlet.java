/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.MusicaDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Musica;

/**
 * @author julio
 */
public class Musica_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Musica_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Musica_servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String acao = request.getParameter("acao");

        if (acao != null && acao.equals("inserirMusica")) {
            // Processar ação específica

            String playlistIdParam = request.getParameter("playlistId");
            String nomePlaylist = request.getParameter("nomePlaylist");
            String idUsuarioParam = request.getParameter("idUsuario");
            int playlistId = 0; // Valor padrão em caso de falha na conversão
            int usuarioId = 0; // Valor padrão em caso de falha na conversão

            if (playlistIdParam != null && !playlistIdParam.isEmpty()) {
                playlistId = Integer.parseInt(playlistIdParam);
            }

            if (idUsuarioParam != null && !idUsuarioParam.isEmpty()) {
                usuarioId = Integer.parseInt(idUsuarioParam);
            }

            // Obter o diretório raiz do contexto da aplicação
            String caminhoRaiz = getServletContext().getRealPath("/");

            // Construir o caminho completo para a pasta da playlist
            String caminhoPasta = caminhoRaiz + "playlists/" + usuarioId + "/" + nomePlaylist;

            // Verifica se a pasta da playlist existe, caso contrário, retorna um erro
            File pastaPlaylist = new File(caminhoPasta);
            if (!pastaPlaylist.exists()) {
                response.sendRedirect("erro.jsp");
                return;
            }

            // Processar o upload da música
            Part musicaPart = request.getPart("musica");
            String nomeMusica = musicaPart.getSubmittedFileName();
            String caminhoCompletoMusica = caminhoPasta + "/" + nomeMusica;
            OutputStream outputStream = new FileOutputStream(new File(caminhoCompletoMusica));
            InputStream inputStream = musicaPart.getInputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.close();
            inputStream.close();

            // Cria um objeto Musica com as informações da música
            Musica musica = new Musica();
            musica.setPlaylistId(playlistId);
            musica.setImagemMusica(caminhoCompletoMusica);

            // Insere a música no banco de dados
            MusicaDAO musicaDAO = new MusicaDAO();
            boolean musicaInserida = musicaDAO.inserirMusica(musica);

            if (musicaInserida) {
                // Música inserida com sucesso
                // Redirecione para uma página de sucesso ou execute a ação desejada
                response.sendRedirect("sucesso.jsp");
            } else {
                // Falha ao inserir a música
                // Redirecione para uma página de erro ou execute a ação desejada
                response.sendRedirect("erro.jsp");
            }
        } else {
            // Ação inválida ou não especificada
            response.sendRedirect("erro.jsp");
        }

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
