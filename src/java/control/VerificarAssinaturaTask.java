package control;

import java.util.Date;
import java.util.TimerTask;

import dao.AssinaturaDAO;

import java.util.List;

import model.Assinatura;

public class VerificarAssinaturaTask extends TimerTask {

    private AssinaturaDAO assinaturaDAO;

    public VerificarAssinaturaTask() {
        assinaturaDAO = new AssinaturaDAO();
    }

    @Override
    public void run() {
        Date dataAtual = new Date();  // Obtém a data atual do servidor

        // Obtenha todas as assinaturas do banco de dados
        List<Assinatura> assinaturas = assinaturaDAO.obterTodasAssinaturas();

        for (Assinatura assinatura : assinaturas) {
            Date dataTermino = assinatura.getData_termino();
            if (dataTermino != null && (dataTermino.before(dataAtual) || dataTermino.equals(dataAtual))) {
                assinatura.setStatus_assinatura(false);  // Define o status da assinatura como false
                assinaturaDAO.atualizarAssinatura(assinatura);  // Atualiza o status no banco de dados
            }
        }
    }
}
