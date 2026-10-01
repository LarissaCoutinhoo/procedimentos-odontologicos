import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';


class FormularioProcedimentoOdonto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioProcedimentoOdontoState();
  }
}

class FormularioProcedimentoOdontoState
    extends State<FormularioProcedimentoOdonto> {
  final TextEditingController _controladorCampoProcedimento =
      TextEditingController();
  final TextEditingController _controladorCampoNumeroFicha =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  static const _tituloAppBar = 'Novo procedimento';
  static const _rotuloCampoProcedimento = 'Procedimento';
  static const _dicaCampoProcedimento = 'Descrição do procedimento';
  static const _rotuloCampoValor = 'Valor';
  static const _dicaCampoValor = '0,00';

  static const _rotuloCampoNumeroFicha = 'Número da ficha';
  static const _dicaCampoNumeroFicha = '0000';
  static const _textoBotaoConfirmar = 'Confirmar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tituloAppBar,        
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoProcedimento,
              rotulo: _rotuloCampoProcedimento,
              dica: _dicaCampoProcedimento,
            ),

            Editor(
              controlador: _controladorCampoNumeroFicha,
              rotulo: _rotuloCampoNumeroFicha,
              dica: _dicaCampoNumeroFicha,
            ),

            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.medical_services,
            ),

            ElevatedButton(
              onPressed: () {
                debugPrint("Clicou aqui...");
                _criaProcedimentoOdonto(
                  context,
                  _controladorCampoProcedimento,
                  _controladorCampoValor,
                  _controladorCampoNumeroFicha,
                );
              },
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }
}

void _criaProcedimentoOdonto(
  BuildContext context,
  TextEditingController controladorCampoProcedimento,
  TextEditingController controladorCampoValor,
  TextEditingController controladorCampoNumeroFicha,
) {
  final String procedimento = controladorCampoProcedimento.text.trim();
  final double? valor = double.tryParse(controladorCampoValor.text);
  final int? numeroFicha = int.tryParse(controladorCampoNumeroFicha.text);

  if (procedimento.isNotEmpty && valor != null && numeroFicha != null) {
    final procedimentoCriado =
        ProcedimentoOdonto(valor, numeroFicha, procedimento);
    debugPrint('$procedimentoCriado'); // Teste de saída no console
    Navigator.pop(context, procedimentoCriado);
  }
}