/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AssinaturaDAO;
import dao.RestricaoDAO;
import dao.UsuarioDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Assinatura;
import model.Restricao;
import model.Usuario;

/**
 * @author julio
 */
@MultipartConfig
public class Usuario_servlet extends HttpServlet {

    //Objetos MODEL / DAO / CONTROL
    Usuario usuario = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();

    //Paginas
    String index = "index.jsp";
    String inicial = "inicial.jsp";
    String erro = "erro.jsp";
    String cadastro_adm = "painel_adm_cadastro.jsp";
    String listar = "painel_adm_listar.jsp";
    String editar = "painel_adm_editar.jsp";
    String editar2 = "editar_perfil.jsp";
    String editar_meu_perfil = "editar_perfil.jsp";
    String abrir;

    public boolean validarDados(Usuario usu) {
        return !usu.getNome().isEmpty()
                && !usu.getUsuario().isEmpty()
                && !usu.getSenha().isEmpty();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Usuario_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuario_servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        HttpSession sessao = request.getSession();
        String acao = request.getParameter("acao");
        try {
            if (acao.equals("listar_usuarios")) {
                AssinaturaDAO assDAO = new AssinaturaDAO();
                abrir = listar;
                List<Usuario> usuarios = dao.read();
                request.setAttribute("usuarios", usuarios);

                RestricaoDAO daoRES = new RestricaoDAO();
                Map<Integer, Boolean> restricoesBanido = new HashMap<>();

                Map<Integer, Long> diasRestantesMap = new HashMap<>(); // Crie o mapa para armazenar os dias restantes

                for (Usuario usuario : usuarios) {
                    int idUsuario = usuario.getIdUsuario();

                    List<Restricao> restricoesUsuario = daoRES.buscarTodasRestricoeUsuario(idUsuario);
                    boolean banido = false;

                    for (Restricao restricao : restricoesUsuario) {
                        if (restricao.isRestrito()) {
                            banido = true;
                            break;
                        }
                    }

                    restricoesBanido.put(idUsuario, banido);

                    // Obter a assinatura do usuário
                    Assinatura assinatura = assDAO.obterDataAssinaturaPorId(idUsuario);

                    if (assinatura != null) {
                        Date dataTermino = assinatura.getData_termino();

                        // Obter a data atual do servidor
                        Date dataAtual = new Date();

                        // Obter a diferença em milissegundos entre as duas datas
                        long diffMillis = dataTermino.getTime() - dataAtual.getTime();

                        // Converter a diferença em milissegundos para dias
                        long diffDays = TimeUnit.MILLISECONDS.toDays(diffMillis);

                        // Armazenar o número de dias restantes no mapa
                        diasRestantesMap.put(idUsuario, diffDays);
                    }
                }
                request.setAttribute("restricoesBanido", restricoesBanido);
                request.getSession().setAttribute("diasRestantesUsuarios", diasRestantesMap);

            } else if (acao.equals("editar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;
                request.setAttribute("usuario", dao.listar_usuario(id));
            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.excluir(id);
                abrir = listar;
                request.setAttribute("usuarios", dao.read());
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO EXCLUIR USUARIO!");
                request.setAttribute("msg", "Tudo certo por aqui!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else if (acao.equals("atualizar_foto_index")) {
                int iduser = (int) sessao.getAttribute("iduser");
                request.setAttribute("usuario", dao.listar_usuario(iduser));
                Usuario usuario = (Usuario) request.getAttribute("usuario");
                sessao.setAttribute("foto_perfil", usuario.getFoto_perfil());
                abrir = index;
            } else if (acao.equals("editar2")) {
                int id = Integer.parseInt(request.getParameter("id"));
                abrir = editar2;
                request.setAttribute("usuario", dao.listar_usuario(id));
                Usuario usuario = (Usuario) request.getAttribute("usuario");
                sessao.setAttribute("foto_perfil", usuario.getFoto_perfil());
            } else {
                abrir = inicial;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SESSÃO INVALIDADA!");
                request.setAttribute("msg", "Oops!! Sua conta foi deslogada, entre novamente!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            }
        } catch (Exception e) {
            System.out.println("Oops!! Erro ao executar operação!" + e);
            abrir = inicial;
            request.setAttribute("popupSuperior", "popupSuperior");
            request.setAttribute("titulo", "SESSÃO INVALIDADA!");
            request.setAttribute("msg", "Oops!! Sua conta foi deslogada, entre novamente!");
            request.setAttribute("animacao", "shake");
            request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
            request.setAttribute("anim_popup", "anim-popup");
            request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                    + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
        }
        if (acao.equals("verificUsu")) {
            String nomeUsuario = request.getParameter("txtUsuario");
            boolean usuarioExistente = dao.verificarUsuarioExistente(nomeUsuario);
            System.out.println("Nome usuario servlet: " + nomeUsuario);

            if (usuarioExistente) {
                response.getWriter().write("existente");
                System.out.println("existente servlet");
            } else {
                response.getWriter().write("disponivel");
                System.out.println("disponivel servlet");
            }
        } else {
            RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
            visualizar.forward(request, response);
        }

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
        //processRequest(request, response);
        String acao = request.getParameter("acao");
        HttpSession sessao = request.getSession();

        if (acao.equals("cad_usuario")) {
            usuario.setNome(request.getParameter("txtNome"));
            usuario.setUsuario(request.getParameter("txtUsuario"));
            usuario.setEmail(request.getParameter("txtEmail"));
            usuario.setSenha(request.getParameter("txtSenha"));
            if (dao.verificarUsuarioExistente(usuario.getUsuario())) {
                // Usuário já está cadastrado
                abrir = inicial;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "USUÁRIO JÁ CADASTRADO!");
                request.setAttribute("msg", "Este Login de Usuário já está em uso, tente outro!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                if (dao.cadastrar(usuario)) {
                    abrir = inicial;
                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "SUCESSO AO CADASTRAR CONTA!");
                    request.setAttribute("msg", "Yeeeeh Agora estamos a um passo de entrar, Faça seu Login!");
                    request.setAttribute("animacao", "impacto");
                    request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                    request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                } else {
                    abrir = inicial;
                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "ERRO AO TENTAR LOGAR!");
                    request.setAttribute("msg", "Usuario ou Senha Incorretos, Tente Novamente!!");
                    request.setAttribute("animacao", "shake");
                    request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                }
            }
        } else if (acao.equals("cad_usuario_painel_adm")) {
            usuario.setNome(request.getParameter("txtNome"));
            usuario.setUsuario(request.getParameter("txtUsuario"));
            usuario.setEmail(request.getParameter("txtEmail"));
            usuario.setSenha(request.getParameter("txtSenha"));
            usuario.setPermissao(request.getParameter("cbPermissao"));
            if (validarDados(usuario)) {
                if (dao.cadastrar_painel_adm(usuario)) {
                    abrir = cadastro_adm;
                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "SUCESSO AO CADASTRAR PERFIL!");
                    request.setAttribute("msg", "Maravilha ADM, o Usuario foi Cadastrado com Sucesso!");
                    request.setAttribute("animacao", "impacto");
                    request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                    request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                } else {
                    abrir = cadastro_adm;
                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "ERRO AO TENTAR CADASTRAR CONTA!");
                    request.setAttribute("msg", "Oops!! Algo deu errado ADM, verifique o Log no servidor ou contate algum superior!!");
                    request.setAttribute("animacao", "shake");
                    request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                }
            }
        } else if (acao.equals("atualizar")) {

            usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
            usuario.setNome(request.getParameter("txtNome"));
            usuario.setUsuario(request.getParameter("txtUsuario"));
            usuario.setEmail(request.getParameter("txtEmail"));
            usuario.setSenha(request.getParameter("txtSenha"));
            usuario.setPermissao(request.getParameter("cbPermissao"));

            int id = Integer.parseInt(request.getParameter("idUsuario"));
            if (dao.atualizar(usuario)) {
                RestricaoDAO daoREs = new RestricaoDAO();
                request.setAttribute("restricao", daoREs.buscarRestricao(id));
                request.setAttribute("buscarRestricoes", daoREs.buscarTodasRestricoeUsuario(id));
                abrir = editar;
                request.setAttribute("usuario", dao.listar_usuario(id));

                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO ATUALIZAR USUARIO!");
                request.setAttribute("msg", "Maravilha, os dados do usuario dados foram atualizados com sucesso!");
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

                request.setAttribute("usuario", dao.listar_usuario(id));
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO TENTAR ATUALIZAR USUARIO!");
                request.setAttribute("msg", "Oops!! Algo deu errado ADM, verifique o Log no servidor ou contate algum superior!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            }
        } else if (acao.equals("atualizar_meu_perfil")) {
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsu")));
            usuario.setNome(request.getParameter("txtNome"));
            usuario.setEmail(request.getParameter("txtEmail"));
            usuario.setSenha(request.getParameter("txtSenha"));
            if (dao.atualizar_meu_perfil(usuario)) {
                abrir = editar2;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO ATUALIZAR PERFIL!");
                request.setAttribute("msg", "Maravilha, seus dados foram atualizados com sucesso!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                abrir = editar2;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO ATUALIZAR DADOS!");
                request.setAttribute("msg", "Confira novamente os dados preenchidos e tente novamente!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            }
        } else if (acao != null && acao.equals("atualizar_foto_perfil")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsu"));

            // Processar o upload da foto de perfil
            Part fotoPart = request.getPart("foto_perfil");

            // Verificar tamanho máximo do arquivo (2MB = 2 * 1024 * 1024 bytes)
            final long MAX_FILE_SIZE = 3 * 1024 * 1024;
            if (fotoPart.getSize() > MAX_FILE_SIZE) {
                // Tamanho do arquivo excede o limite permitido
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! TAMANHO MÁXIMO ATINGIDO!");
                request.setAttribute("msg", "Oops!! Tamanho máximo permitido de 2mb");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar_perfil.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Verificar extensão do arquivo (aceitar apenas .jpg, .jpeg, .gif, .png)
            String nomeFoto = fotoPart.getSubmittedFileName();
            if (!nomeFoto.toLowerCase().endsWith(".jpg") && !nomeFoto.toLowerCase().endsWith(".jpeg") && !nomeFoto.toLowerCase().endsWith(".gif") && !nomeFoto.toLowerCase().endsWith(".png") && !nomeFoto.toLowerCase().endsWith(".png")) {
                // Extensão do arquivo não é suportada
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "FORMATO INVÁLIDO!");
                request.setAttribute("msg", "Oops!! A imagem de perfil só poderá ser dos formatos (PNG,JPG,JPEG,GIF)!!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar_perfil.jsp");
                dispatcher.forward(request, response);
                return;
            }

            String usuario_id = request.getParameter("idUsu");
            // Diretório para armazenar os dados do usuário
            String caminhoRaiz = getServletContext().getRealPath("/");
            String caminhoPasta = caminhoRaiz + "dadosUsuario/" + usuario_id + "/foto_perfil";

            // Verifica se a pasta do usuário existe, caso contrário, cria-a
            File pastaUsuario = new File(caminhoPasta);
            if (!pastaUsuario.exists()) {
                pastaUsuario.mkdirs();
            } else {
                // Exclui os arquivos existentes na pasta foto_perfil
                File[] arquivos = pastaUsuario.listFiles();
                if (arquivos != null) {
                    for (File arquivo : arquivos) {
                        arquivo.delete();
                    }
                }
            }

            // Realiza o upload da imagem
            String nomeArquivo = nomeFoto; // Gera um nome único para o arquivo
            String caminhoCompletoImagem = caminhoPasta + "/" + nomeArquivo;
            String caminhoImagem = "dadosUsuario/" + usuario_id + "/foto_perfil" + "/" + nomeArquivo;

            OutputStream outputStream = new FileOutputStream(new File(caminhoCompletoImagem));
            InputStream inputStream = fotoPart.getInputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.close();
            inputStream.close();

            // Cria o objeto Usuario e atribui os valores
            usuario.setFoto_perfil(caminhoImagem);
            usuario.setIdUsuario(idUsuario);

            // Chamar método para atualizar o perfil do usuário no banco de dados
            boolean usuarioAtualizado = dao.atualizar_foto_perfil(usuario);

            if (usuarioAtualizado) {
                abrir = editar2;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO ATUALIZAR IMAGEM DE PERFIL!");
                request.setAttribute("msg", "Maravilha, sua imagem de perfil foi atualizada com sucesso!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                abrir = editar2;
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO AO ATUALIZAR IMAGEM DE PERFIL!");
                request.setAttribute("msg", "Oops!! Tamanho máximo permitido de 2mb e formatos (PNG,JPG,JPEG,GIF)!!");
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
