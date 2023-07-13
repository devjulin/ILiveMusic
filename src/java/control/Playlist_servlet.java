/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.PlaylistDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Playlist;
import model.Usuario;

/**
 * @author julio
 */
@MultipartConfig
public class Playlist_servlet extends HttpServlet {

    Playlist playlist = new Playlist();
    PlaylistDAO dao = new PlaylistDAO();
    Usuario usuario = new Usuario();

    String abrir = "";
    String selecPlaylist = "playlist.jsp";
    String ppremium = "painel_premium.jsp";

    private boolean excluirPasta(File pasta) {
        if (pasta.isDirectory()) {
            // Obter a lista de arquivos dentro da pasta
            File[] arquivos = pasta.listFiles();

            if (arquivos != null) {
                // Excluir todos os arquivos dentro da pasta
                for (File arquivo : arquivos) {
                    excluirPasta(arquivo);
                }
            }
        }

        // Excluir a pasta em si
        return pasta.delete();
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
            out.println("<title>Servlet Playlist_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Playlist_servlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String acao = request.getParameter("acao");
        if (acao != null && acao.equals("excluirPlaylist")) {
            int idPlaylist = Integer.parseInt(request.getParameter("idPlaylist"));
            // Obtenha o caminho da pasta a ser excluída do banco de dados
            String caminhoPasta = dao.obterCaminhoPasta(idPlaylist);

            File pasta = new File(caminhoPasta);

            // Verificar se a pasta existe
            if (pasta.exists()) {
                // Excluir a pasta e todo o seu conteúdo
                excluirPasta(pasta);

                dao.excluirPlaylist(idPlaylist);
                // Obter a ID do usuário da URL
                int id = Integer.parseInt(request.getParameter("id"));
                List<Playlist> listarplaylists = dao.listarPlaylists(id);
                request.setAttribute("playlists", listarplaylists);

                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO EXCLUIR PLAYLIST!");
                request.setAttribute("msg", "Playlist excluída com sucesso!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");

            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                dispatcher.forward(request, response);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! ESTA PLAYLIST NÃO EXISTE!");
                request.setAttribute("msg", "Oops!! Aparentemente esta playlist não existe mais!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");

            }
        } else if (acao.equals("listarPlaylistsUsu")) {
            abrir = ppremium;

            // Obter a ID do usuário da URL
            int id = Integer.parseInt(request.getParameter("id"));

            List<Playlist> listarplaylists = dao.listarPlaylists(id);
            request.setAttribute("playlists", listarplaylists);
        } else if (acao != null && acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            
        }

        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
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

        if (acao != null && acao.equals("criarPlaylist")) {
            String nomePlaylist = request.getParameter("nomePlaylist");
            String idUsuarioParam = request.getParameter("idUsuario");
            int usuarioId = 0; // Valor padrão em caso de falha na conversão

            if (idUsuarioParam != null && !idUsuarioParam.isEmpty()) {
                try {
                    usuarioId = Integer.parseInt(idUsuarioParam);
                } catch (NumberFormatException e) {
                    // Tratar erro de conversão de idUsuarioParam para inteiro
                    // Redirecionar para uma página de erro ou execute a ação desejada
                    response.sendRedirect("erro.jsp");
                    return;
                }
            }

            // Obter o diretório raiz do contexto da aplicação
            String caminhoRaiz = getServletContext().getRealPath("/");

            // Construir o caminho completo para a pasta da playlist
            String caminhoPasta = caminhoRaiz + "playlists/" + usuarioId + "/" + nomePlaylist;
            String caminhoImagem = caminhoPasta; // Caminho da imagem é igual ao caminho da pasta

            File pastaUsuario = new File(caminhoRaiz + "playlists/" + usuarioId);
            File[] pastas = pastaUsuario.listFiles();

            if (pastas.length == 10) {
                // Obter a ID do usuário da URL
                int id = Integer.parseInt(idUsuarioParam);
                List<Playlist> listarplaylists = dao.listarPlaylists(id);
                request.setAttribute("playlists", listarplaylists);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! NÚMERO MÁXIMO ATINGIDO!");
                request.setAttribute("msg", "Oops!! Você já possui o número máximo de playlists possível, que são 10 Playlists!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                dispatcher.forward(request, response);
                return;
            }
            // Verifica se a pasta da playlist existe, caso contrário, cria-a
            File pastaPlaylist = new File(caminhoPasta);
            if (!pastaPlaylist.exists()) {
                try {
                    pastaPlaylist.mkdirs(); // Cria a pasta e todas as subpastas necessárias

                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "SUCESSO AO CRIAR PLAYLIST!");
                    request.setAttribute("msg", "Playlist criada com sucesso!!");
                    request.setAttribute("animacao", "impacto");
                    request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                    request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                } catch (SecurityException e) {
                    // Tratar erro ao criar a pasta da playlist
                    // Redirecionar para uma página de erro ou execute a ação desejada

                    RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                    dispatcher.forward(request, response);
                    request.setAttribute("popupSuperior", "popupSuperior");
                    request.setAttribute("titulo", "ERRO !! ESTA PLAYLIST JÁ EXISTE!");
                    request.setAttribute("msg", "Oops!! Você já possui uma playlist com este nome!");
                    request.setAttribute("animacao", "shake");
                    request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                    request.setAttribute("anim_popup", "anim-popup");
                    request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                            + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                    return;
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                dispatcher.forward(request, response);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! ESTA PLAYLIST JÁ EXISTE!");
                request.setAttribute("msg", "Oops!! Você já possui uma playlist com este nome!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                return;
            }

            // Processar o upload da imagem de capa
            Part imagemPart = request.getPart("imagem");

            // Verificar tamanho máximo do arquivo (3MB = 3 * 1024 * 1024 bytes)
            final long MAX_FILE_SIZE = 5 * 1024 * 1024;
            if (imagemPart.getSize() > MAX_FILE_SIZE) {
                // Tamanho do arquivo excede o limite permitido
                int id = Integer.parseInt(idUsuarioParam);
                List<Playlist> listarplaylists = dao.listarPlaylists(id);
                request.setAttribute("playlists", listarplaylists);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! TAMANHO MÁXIMO ATINGIDO!");
                request.setAttribute("msg", "Oops!! Tamanho máximo permitido de 2mb");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                response.sendRedirect("painel_premium.jsp");
                pastaPlaylist.delete();
                return;
            }

            // Verificar extensão do arquivo (aceitar apenas .jpg)
            String nomeImagem = imagemPart.getSubmittedFileName();
            if (!nomeImagem.toLowerCase().endsWith(".jpg") && !nomeImagem.toLowerCase().endsWith(".jpeg") && !nomeImagem.toLowerCase().endsWith(".gif")) {
                // Extensão do arquivo não é suportada
                int id = Integer.parseInt(idUsuarioParam);
                List<Playlist> listarplaylists = dao.listarPlaylists(id);
                request.setAttribute("playlists", listarplaylists);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! SELECIONE UMA IMAGEM!");
                request.setAttribute("msg", "Oops!! É obrigatório selecionar uma imagem para a Playlist!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                response.sendRedirect("painel_premium.jsp");
                pastaPlaylist.delete();
                return;
            }

            String caminhoCompletoImagem = caminhoImagem + "/capa_playlist/" + nomeImagem;
            File pastaCapaPlaylist = new File(caminhoImagem + "/capa_playlist");
            if (!pastaCapaPlaylist.exists()) {
                pastaCapaPlaylist.mkdirs(); // Cria a pasta da capa da playlist
            }
            OutputStream outputStream = new FileOutputStream(new File(caminhoCompletoImagem));
            InputStream inputStream = imagemPart.getInputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.close();
            inputStream.close();

            // Restante do código para criar a Playlist e redirecionar
            Playlist playlist = new Playlist();
            playlist.setNome_playlist(nomePlaylist);
            playlist.setUsuario_id(usuarioId);
            playlist.setCaminho_pasta(caminhoPasta);
            String caminhosalvarimg = "playlists/" + usuarioId + "/" + nomePlaylist + "/capa_playlist" + "/" + nomeImagem;
            playlist.setCaminho_imagem(caminhosalvarimg); // Armazena o caminho completo da imagem

            PlaylistDAO playlistDAO = new PlaylistDAO();
            boolean playlistCriada = playlistDAO.criarPlaylist(playlist);
            // Obter a ID do usuário da URL
            int id = Integer.parseInt(idUsuarioParam);
            List<Playlist> listarplaylists = dao.listarPlaylists(id);
            request.setAttribute("playlists", listarplaylists);
            if (playlistCriada) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                dispatcher.forward(request, response);
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "SUCESSO AO CRIAR PLAYLIST!");
                request.setAttribute("msg", "Playlist criada com sucesso!!");
                request.setAttribute("animacao", "impacto");
                request.setAttribute("cor_fundo", "style=\"background-color: rgba(34,139,34, 0.94);\\\"");
                request.setAttribute("cor_titulo", "style=\"color:#FFE4B5;\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets1.lottiefiles.com/packages/lf20_s2lryxtd.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
            } else {
                // Falha ao criar a playlist
                // Redirecione para uma página de erro ou execute a ação desejada
                request.setAttribute("popupSuperior", "popupSuperior");
                request.setAttribute("titulo", "ERRO !! HMMM.. NADA BOM!");
                request.setAttribute("msg", "Oops!! Algo deu errado, verifique se selecionou a imagem de capa da playlist!");
                request.setAttribute("animacao", "shake");
                request.setAttribute("cor_titulo", "style=\"color:#DC143C;\\\"");
                request.setAttribute("anim_popup", "anim-popup");
                request.setAttribute("anim", "<script src=\"https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js\"></script>\n"
                        + "<lottie-player src=\"https://assets10.lottiefiles.com/packages/lf20_ckcn4hvm.json\"  background=\"transparent\"  speed=\"1\"  style=\"width: 100px; height: 100px;\"  loop  autoplay></lottie-player>");
                pastaPlaylist.delete();
                RequestDispatcher dispatcher = request.getRequestDispatcher("painel_premium.jsp");
                dispatcher.forward(request, response);
            }
        } else if (acao != null && acao.equals("selecionarPlaylist")) {
            int idPlaylist = Integer.parseInt(request.getParameter("idPlaylist"));
            abrir = selecPlaylist;
            Playlist playlistSelecionada = dao.selecionarPlaylist(idPlaylist);
            request.getSession().setAttribute("playlistSelecionada", playlistSelecionada);
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
