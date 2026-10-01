import 'package:flutter/material.dart';
import 'screens/transferencias/lista.dart';
import 'package:intl/intl.dart';

void main() => runApp(ClinicaOdontologicaApp());

class ClinicaOdontologicaApp extends StatelessWidget {
  const ClinicaOdontologicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = "pt_BR";
    return MaterialApp(
      theme: ThemeData(
        // Ativa o estilo Material 3, mais atual e com suporte aos widgets modernos
        useMaterial3: true,

        // Define uma paleta de cores a partir de uma cor base (verde, nesse caso)
        // O Flutter gera automaticamente variações coerentes (primary, secondary, etc.)
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue.shade100, // Cor principal do app
        ),

        scaffoldBackgroundColor: Colors.white,

        // Define a cor principal do aplicativo para widgets que ainda usam essa propriedade
        primaryColor: const Color.fromARGB(255, 79, 188, 247),

        // Tema para a AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue.shade100, // Fundo da AppBar
          foregroundColor: Colors.black87, // Texto e ícones na AppBar
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Tema para botões elevados (substitui o antigo buttonTheme)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue.shade300, // Cor de fundo do botão
            foregroundColor: Colors.black87, // Cor do texto/ícones no botão
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Tema para o FloatingActionButton (FAB)
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlue.shade300, // Cor do botão flutuante
          foregroundColor: Colors.black87, // Cor do ícone
        ),

        // Tema para campos de texto (TextField, por exemplo)
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(), // Define borda padrão
        ),
      ),
      home: ListaProcedimentosOdonto(),
    );
  }
}
