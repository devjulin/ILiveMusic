/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AssinaturaDAO;
import dao.PagamentoDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Assinatura;

/**
 * @author julio
 */
public class Assinatura_servlet extends HttpServlet {

    //Objetos MODEL / DAO / CONTROL
    AssinaturaDAO dao = new AssinaturaDAO();
    PagamentoDAO daopgto = new PagamentoDAO();
    Assinatura assinatura = new Assinatura();
    //Paginas
    String index = "index.jsp";
    String erro = "erro.jsp";
    String listar = "painel_adm_listar_assinaturas.jsp";
    String listarpgto = "painel_adm_listar_pagamentos.jsp";
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
            out.println("<title>Servlet Assinatura_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Assinatura_servlet at " + request.getContextPath() + "</h1>");
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
        try {
            if (acao.equals("listar_assinaturas")) {
                abrir = listar;
                request.setAttribute("assinatura", dao.read());
            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO EXCLUIR A ASSINATURA PREMIUM!");
                request.setAttribute("msg", "Yeeehh!! A assinatura do usuario foi excluida com sucesso!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                dao.excluir(id);
                abrir = listar;
                request.setAttribute("assinatura", dao.read());
            }
        } catch (Exception e) {
            request.setAttribute("popupSuperior", "popupSuperior");
            request.setAttribute("titulo", "ERRO AO TENTAR EXCLUIR A ASSINATURA!");
            request.setAttribute("msg", "Oops!! Algo deu errado ADM, verifique o Log no servidor ou contate algum superior!!");
            request.setAttribute("animacao", "shake");
            request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
            request.setAttribute("anim_popup", "anim-popup");
            request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                    + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            abrir = listar;
            request.setAttribute("assinatura", dao.read());
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

        if (acao != null && acao.equals("cadastrar_assinatura")) {
            int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
            int cod_hash_pgto = Integer.parseInt(request.getParameter("cod_hash_pgto"));
            boolean statusAssinatura = Boolean.parseBoolean(request.getParameter("statusAssinatura"));
            int qtdDiasPremium = Integer.parseInt(request.getParameter("qtdDiasPremium"));

            // Obter a data de início atual do servidor
            Date dataInicio = new Date();

            // Calcular a data de término adicionando a quantidade de dias premium à data de início
            long millisPorDia = 24 * 60 * 60 * 1000; // Milissegundos em um dia
            long dataInicioMillis = dataInicio.getTime();
            long dataTerminoMillis = dataInicioMillis + (qtdDiasPremium * millisPorDia);
            Date dataTermino = new Date(dataTerminoMillis);

            // Restante do seu código para cadastrar a assinatura no banco de dados
            Assinatura assinatura = new Assinatura();
            assinatura.setUsuario_id(usuarioId);
            assinatura.setCodigo_hash_pgto(cod_hash_pgto);
            assinatura.setStatus_assinatura(statusAssinatura);
            assinatura.setData_inicio(dataInicio);
            assinatura.setData_termino(dataTermino);

            //Alterando o status do pagamento para true
            PagamentoDAO pagDAO = new PagamentoDAO();
            boolean atualizacaoStatusSucesso = pagDAO.alterarStatusPagamento(cod_hash_pgto, true);

            // Chame o método apropriado para cadastrar a assinatura no banco de dados
            boolean sucesso = dao.cadastrar_assinatura(assinatura);

            // Redirecionar para a página adequada
            if (sucesso && atualizacaoStatusSucesso) {
                abrir = listarpgto;
                request.setAttribute("pagamento", daopgto.read());

                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO ATIVAR A ASSINATURA PREMIUM!");
                request.setAttribute("msg", "Yeeehh!! A assinatura do usuario foi ativada com sucesso!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                abrir = listarpgto;
                request.setAttribute("pagamento", daopgto.read());

                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR ATIVAR A ASSINATURA!");
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
