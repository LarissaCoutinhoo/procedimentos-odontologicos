import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario.dart';
import 'package:intl/intl.dart';

class ListaProcedimentosOdonto extends StatefulWidget {
  final List<ProcedimentoOdonto> _procedimentos = [
    ProcedimentoOdonto(180.0, 101, 'Limpeza dental'),
    ProcedimentoOdonto(350.0, 102, 'Obturação'),
  ];

  @override
  State<StatefulWidget> createState() {
    return ListaProcedimentosOdontoState();
  }
}

class ListaProcedimentosOdontoState extends State<ListaProcedimentosOdonto> {
  static const _tituloAppBar = "🦷 Mais Sorriso";

  Future<void> _atualiza(ProcedimentoOdonto? procedimentoRecebido) async {
    if (procedimentoRecebido != null) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        widget._procedimentos.add(procedimentoRecebido);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: ListView.builder(
        itemCount: widget._procedimentos.length,
        itemBuilder: (context, indice) {
          final procedimento = widget._procedimentos[indice];
          return ItemProcedimentoOdonto(procedimento);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Botão + pressionado");
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context){
                return FormularioProcedimentoOdonto();
              },
            ),
          ).then((procedimentoRecebido) => _atualiza(procedimentoRecebido));
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }  
}

class ItemProcedimentoOdonto extends StatelessWidget {
  final ProcedimentoOdonto _procedimento;

  ItemProcedimentoOdonto(this._procedimento);

  @override
  Widget build(BuildContext context) {
    NumberFormat formato = NumberFormat.simpleCurrency();
    return Card(
      child: ListTile(
        leading: Icon(Icons.medical_services),
        title: Text(_procedimento.procedimento),
        subtitle: Text(
          'Ficha: ${_procedimento.numeroFicha}\n'
          'Valor: ${formato.format(_procedimento.valor)}',
        ),
      ),
    );
  }
}
