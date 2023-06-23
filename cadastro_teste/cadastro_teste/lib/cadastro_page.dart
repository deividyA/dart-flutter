import 'dart:io';

import 'package:flutter/material.dart';

class CadastroPessoa extends StatefulWidget {
  const CadastroPessoa({super.key});

  @override
  State<CadastroPessoa> createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  final campo_nota1 = TextEditingController();
  final campo_nota2 = TextEditingController();

  double? nota1;
  double? nota2;

  void getControllerValues() {
    setState(() {
      nota1 = double.tryParse(campo_nota1.text);
      nota1 ??= 0;
      nota2 = double.tryParse(campo_nota2.text);
      nota2 ??= 0;
    });
  }

  void mostrarMensagem(String mensagem) {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.blue,
        ),
      );
    });
  }

  void clearText() {
    campo_nota1.clear();
    campo_nota2.clear();
  }

  String calculaMedia(nota1, nota2) {
    String texto_resultado;
    double resultado = (nota1 + nota2) / 2;
    if (resultado >= 6) {
      texto_resultado = 'Aprovado';
    } else if (resultado < 6) {
      texto_resultado = 'Reprovado';
    } else {
      texto_resultado = 'Indefinido';
    }
    return texto_resultado;
  }

  @override
  void dispose() {
    campo_nota1.dispose();
    campo_nota2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Funcionários'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: campo_nota1,
              autofocus: true,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "",
                  label: Text("Nota 1"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              maxLines: 1,
              maxLength: 2,
            ),
            TextFormField(
              controller: campo_nota2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "",
                  label: Text("Nota 2"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              maxLines: 1,
              maxLength: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      getControllerValues();
                      if ((nota1 != '') && (nota2 != '')) {
                        mostrarMensagem(calculaMedia(nota1, nota2));
                        clearText();
                      } else {
                        mostrarMensagem('Campos obrigatórios não preenchidos');
                      }
                    },
                    child: const Text('Media')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
