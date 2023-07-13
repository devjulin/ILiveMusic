/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.PagamentoDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pagamento;

/**
 * @author julio
 */
public class Pagamento_servlet extends HttpServlet {

    //Objetos MODEL / DAO / CONTROL
    Pagamento pagamento = new Pagamento();
    PagamentoDAO dao = new PagamentoDAO();

    //Paginas
    String index = "index.jsp";
    String erro = "erro.jsp";
    String listar = "painel_adm_listar_pagamentos.jsp";
    String editar = "painel_adm_editar.jsp";
    String editar2 = "editar_perfil.jsp";
    String editar_meu_perfil = "editar_perfil.jsp";
    String pagamentoFalhou = "assinatura.jsp";
    String finalizarCheckout = "assinatura_finalizar.jsp";

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
            out.println("<title>Servlet Pagamento_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pagamento_servlet at " + request.getContextPath() + "</h1>");
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
        String acao = request.getParameter("acao");

        try {
            if (acao.equals("listar_pagamentos")) {
                abrir = listar;
                request.setAttribute("pagamento", dao.read());
            }
        } catch (Exception e) {
            System.out.println("Oops!! Erro ao executar operação!" + e);
            abrir = erro;
        }
        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
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

        if (acao != null && acao.equals("cadastrar_pgto")) {
            int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
            int qtdDiasPremium = Integer.parseInt(request.getParameter("qtdDiasPremium"));

            pagamento.setUsuario_id(usuarioId);
            pagamento.setStatus_pagamento(false);

            // Calcular data de expiração como a data atual + 31 dias
            Date dataAtual = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(dataAtual);
            cal.add(Calendar.DAY_OF_MONTH, 31);
            Date dataExpiracao = cal.getTime();

            pagamento.setData_espiracao(dataExpiracao);
            pagamento.setQtd_dias_premium(qtdDiasPremium);
            if (dao.cadastrar(pagamento)) {
                String imagemAssinatura = request.getParameter("imagemAssinatura");
                System.out.println(imagemAssinatura);
                request.setAttribute("imagemAssinatura", imagemAssinatura);

                int cod_hash = dao.buscarUltimoCodigoHash(usuarioId);
                request.setAttribute("codigoHash", cod_hash);
                System.out.println(cod_hash);
                abrir = finalizarCheckout;
            } else {
                abrir = pagamentoFalhou;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR CADASTRAR CODIGO HASH!");
                request.setAttribute("msg", "Oops!! Algo deu errado, tente novamente mais tarde ou contate algum superior!!");
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
