package control;

import dao.PagamentoDAO;

import java.util.TimerTask;

public class VerificarPagamentosTask extends TimerTask {

    private PagamentoDAO pagamentoDAO;

    public VerificarPagamentosTask(PagamentoDAO pagamentoDAO) {
        this.pagamentoDAO = pagamentoDAO;
    }

    @Override
    public void run() {
        pagamentoDAO.excluirPagamentosExpirados();
    }
}
