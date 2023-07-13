package control;

import java.util.Date;
import java.util.TimerTask;

import dao.RestricaoDAO;

import java.util.List;

import model.Restricao;

public class VerificarRestricaoTask extends TimerTask {

    private RestricaoDAO resDAO;

    public VerificarRestricaoTask() {
        resDAO = new RestricaoDAO();
    }

    @Override
    public void run() {
        Date dataAtual = new Date();  // Obtém a data atual do servidor

        // Obtenha todas as restrições do banco de dados
        List<Restricao> restricoes = resDAO.buscarTodasRestricoes();

        for (Restricao restricao : restricoes) {
            if (restricao.getDataTermino().before(dataAtual)) {
                restricao.setRestrito(false);  // Define o valor restrito como false
                resDAO.atualizarRestricao(restricao);  // Atualiza o valor no banco de dados
            }
        }
    }
}
