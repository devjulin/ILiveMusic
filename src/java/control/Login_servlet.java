/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AssinaturaDAO;
import dao.PagamentoDAO;
import dao.RestricaoDAO;
import dao.UsuarioDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.concurrent.TimeUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Assinatura;
import model.Playlist;
import model.Restricao;
import model.Usuario;

/**
 * @author julio
 */
public class Login_servlet extends HttpServlet {
//Objetos globais

    UsuarioDAO dao = new UsuarioDAO();
    Usuario usuario = new Usuario();
    Restricao restricao = new Restricao();
    RestricaoDAO resDAO = new RestricaoDAO();
    PagamentoDAO pgtoDAO = new PagamentoDAO();
    AssinaturaDAO assDAO = new AssinaturaDAO();
    Assinatura assinatura = new Assinatura();
    Playlist playlist = new Playlist();

    //Paginas
    String index = "index.jsp";
    String erro = "erro.jsp";
    String inicial = "inicial.jsp";
    String abrir = "";
    //Timer periodico
    private Timer timer;

    @Override
    public void init() throws ServletException {
        super.init();

        // Crie uma nova instância da tarefa agendada
        VerificarRestricaoTask resTask = new VerificarRestricaoTask();

        // Criar uma nova instância da tarefa agendada
        VerificarPagamentosTask pgtoTask = new VerificarPagamentosTask(pgtoDAO);

        // Crie uma nova instância da tarefa agendada
        VerificarAssinaturaTask assTask = new VerificarAssinaturaTask();

        // Converter 10 segundos para milissegundos
        long intervaloEmSegundos = TimeUnit.SECONDS.toMillis(1);

        // Criando um timer e agendando a tarefa para ser executada a cada intervalo desejado (10 minutos)
        timer = new Timer();
        timer.schedule(resTask, 0, intervaloEmSegundos);
        timer.schedule(pgtoTask, 0, intervaloEmSegundos);
        timer.schedule(assTask, 0, intervaloEmSegundos);
    }

    @Override
    public void destroy() {
        super.destroy();

        // Cancelar o timer quando o servlet for encerrado
        timer.cancel();
    }

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
            out.println("<title>Servlet Login_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login_servlet at " + request.getContextPath() + "</h1>");
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
        //   processRequest(request, response);
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<String> usuarios = usuarioDAO.listarLogin();

        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("inicial.jsp").forward(request, response);
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

        String acao = request.getParameter("acao");

        HttpSession sessao = request.getSession();

        // Logout
        if (acao.equals("logout")) {
            sessao.removeAttribute("user");
            sessao.removeAttribute("permissao");
            sessao.invalidate();
            response.sendRedirect("index.jsp");
            return;
        }

        // Login
        if (acao.equals("logar")) {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            usuario.setUsuario(user);
            usuario.setSenha(pass);
            usuario = dao.logar(usuario);
            if (usuario.getNome() != null) {
                abrir = index;
                int iduser = usuario.getIdUsuario();
                sessao.setAttribute("iduser", iduser);
                sessao.setAttribute("user", user);
                sessao.setAttribute("usuario", usuario);
                request.setAttribute("usuario", dao.listar_usuario(iduser));
                Usuario usuario = (Usuario) request.getAttribute("usuario");
                sessao.setAttribute("foto_perfil", usuario.getFoto_perfil());
                sessao.setAttribute("foto_capa_playlist", playlist.getCaminho_imagem());
                sessao.setAttribute("assinatura_bj", assinatura);

                //Assinatura
                Assinatura assinatura = new Assinatura();
                // Recupere o valor do status da assinatura do banco de dados
                boolean statusAssinatura = assDAO.obterStatusAssinatura(iduser);
                // Defina o valor do status da assinatura no objeto Assinatura
                assinatura.setStatus_assinatura(statusAssinatura);
                // Defina o objeto Assinatura no atributo de sessão
                sessao.setAttribute("assinante_status", assinatura.isStatus_assinatura());

                Assinatura assinante = assDAO.obterDataAssinaturaPorId(iduser);
                if (assinante != null) {
                    Date dataTermino = assinante.getData_termino();

                    // Obter a data atual do servidor
                    Date dataAtual = new Date();

                    // Obter a diferença em milissegundos entre as duas datas
                    long diffMillis = dataTermino.getTime() - dataAtual.getTime();

                    // Converter a diferença em milissegundos para dias
                    long diffDays = TimeUnit.MILLISECONDS.toDays(diffMillis);

                    // Configurar o atributo para exibição no JSP
                    sessao.setAttribute("diasRestantes", diffDays);

                    if (diffDays >= 28 && diffDays <= 30 || diffDays >= 88 && diffDays <= 90) {
                        request.setAttribute("usuarios", dao.read());
                        request.setAttribute("popupSuperior", "popupSuperior");
                        request.setAttribute("titulo", "ASSINANTE PREMIUM!");
                        request.setAttribute("cor_msg", "text-white fw-bold fs-5");
                        request.setAttribute("msg", "Curta sua assinatura com todos os recursos liberados!! Sua assinatura foi recentemente ativada, desfrute da ILiveMusic!");
                        request.setAttribute("animacao", "movement");
                        request.setAttribute("cor_fundo", "style=\"background-color: rgba(173, 157, 111, 0.94);\\\"");
                        request.setAttribute("cor_titulo", "permissao-premium");
                        request.setAttribute("anim_popup", "anim-popup");
                        request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n" +
                                "<lottie-player src=\"https://assets8.lottiefiles.com/packages/lf20_4kRsd28ycD.json\"  background=\"transparent\"  speed=\"0.9\"  style=\"width: 20em; height: 20em;\"  loop  autoplay></lottie-player>");
                    }
                }

                //Fim Assinatura

                RestricaoDAO resDAO = new RestricaoDAO();

                Restricao restricao = resDAO.buscarRestricao(iduser);  // Obtém o objeto Restricao do banco de dados

                // Verifica se a restrição não é nula antes de fazer a verificação da data de término
                if (restricao != null) {
                    Date dataAtual = new Date();
                    if (restricao.getDataTermino() != null && restricao.getDataTermino().before(dataAtual)) {
                        restricao.setRestrito(false);
                        resDAO.atualizarRestricao(restricao);
                    }
                    sessao.setAttribute("restrito_jsp", restricao);
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    String dataInicioFormatada = dateFormat.format(restricao.getDataTermino());
                    sessao.setAttribute("dataTermino", dataInicioFormatada);
                } else {
                    sessao.setAttribute("restrito_jsp", null);
                    sessao.setAttribute("dataTermino", null);
                }

                sessao.setAttribute("permissao", usuario.getPermissao());
                sessao.setAttribute("usuId", usuario.getIdUsuario());
            } else {
                abrir = inicial;
                //Setando um atributo que ira trocar o nome do ${modal} na pagina JSP para o valor "myModal" podendo assim abrir o modal. 
                request.setAttribute("modal", "myModal");
                sessao.removeAttribute("user");
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR LOGAR!");
                request.setAttribute("msg", "Usuario ou Senha Incorretos, Tente Novamente!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                /*request.setAttribute("cor_fundo", "style=\"background-color: rgba(255, 10, 92, 0.94);\"");*/
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
