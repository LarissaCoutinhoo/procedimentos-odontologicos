class ProcedimentoOdonto {
  final String procedimento;
  final double valor;
  final int numeroFicha;

  ProcedimentoOdonto(this.valor, this.numeroFicha, [this.procedimento = '']);

  int get numeroConta => numeroFicha;

  @override
  String toString() {
    return "ProcedimentoOdonto{procedimento: $procedimento, valor: $valor, numeroFicha: $numeroFicha}";
  }
}

typedef Transferencia = ProcedimentoOdonto;

