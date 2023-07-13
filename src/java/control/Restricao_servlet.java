/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.RestricaoDAO;
import dao.UsuarioDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Restricao;

/**
 * @author julio
 */
public class Restricao_servlet extends HttpServlet {

    //Objetos MODEL / DAO / CONTROL
    Restricao restricao = new Restricao();
    RestricaoDAO dao = new RestricaoDAO();
    UsuarioDAO daoUsu = new UsuarioDAO();

    //Paginas
    String index = "index.jsp";
    String erro = "erro.jsp";
    String listar = "painel_adm_listar.jsp";
    String editar = "painel_adm_editar.jsp";
    String editar2 = "editar_perfil.jsp";
    String editar_meu_perfil = "editar_perfil.jsp";
    String abrir;

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
            out.println("<title>Servlet Restricao_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Restricao_servlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String acao = request.getParameter("acao");

        /* if (acao.equals("listar_restricao")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("restricao", dao.buscarRestricao(id));
            request.setAttribute("buscarRestricoes", dao.buscarTodasRestricoeUsuario(id));
        }
         */
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

        if (acao.equals("reg_restricao")) {
            restricao.setUsuario_id(Integer.parseInt(request.getParameter("usuario_id")));

            boolean restrito = request.getParameter("txtRestrito") != null;
            restricao.setRestrito(restrito);

            Date dataInicio = new Date();
            restricao.setDataInicio(dataInicio);

            String dataTerminoString = request.getParameter("dataTermino");
            Date dataTermino = null;
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dataTermino = dateFormat.parse(dataTerminoString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            restricao.setDataTermino(dataTermino);

            restricao.setMotivo(request.getParameter("txtMotivo"));
            int id = Integer.parseInt(request.getParameter("usuario_id"));
            if (dao.cadastrar(restricao)) {
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;

                request.setAttribute("usuario", daoUsu.listar_usuario(id));
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO REGISTRAR RESTRIÇÃO!");
                request.setAttribute("msg", "O usuario agora irá ser restrito de acessar a plataforma ILiveMusic!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;

                request.setAttribute("usuario", daoUsu.listar_usuario(id));
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR ATUALIZAR RESTRIÇÃO!");
                request.setAttribute("msg", "Oops!! Algo deu errado ADM, verifique o Log no servidor ou contate algum superior!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            }
        } else if (acao.equals("atualizar_restricao")) {
            restricao.setId_restricao(Integer.parseInt(request.getParameter("id_restricao")));

            restricao.setUsuario_id(Integer.parseInt(request.getParameter("usuario_id")));

            boolean restrito = request.getParameter("txtRestrito") != null;
            restricao.setRestrito(restrito);

            String dataInicioString = request.getParameter("dataInicio");
            Date dataInicio = null;
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dataInicio = dateFormat.parse(dataInicioString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            restricao.setDataInicio(dataInicio);

            String dataTerminoString = request.getParameter("dataTermino");
            Date dataTermino = null;
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dataTermino = dateFormat.parse(dataTerminoString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            restricao.setDataTermino(dataTermino);

            restricao.setMotivo(request.getParameter("txtMotivo"));
            int id = Integer.parseInt(request.getParameter("usuario_id"));
            if (dao.atualizar(restricao)) {
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;

                request.setAttribute("usuario", daoUsu.listar_usuario(id));
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO REGISTRAR RESTRIÇÃO!");
                request.setAttribute("msg", "O usuario agora irá ser restrito de acessar a plataforma ILiveMusic!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;

                request.setAttribute("usuario", daoUsu.listar_usuario(id));
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR ATUALIZAR RESTRIÇÃO!");
                request.setAttribute("msg", "Oops!! Algo deu errado ADM, verifique o Log no servidor ou contate algum superior!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            }
        }

        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);

        visualizar.forward(request, response);
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
