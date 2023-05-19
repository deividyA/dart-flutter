import 'dart:convert';

import 'package:dart_async/repositories/cep_repositorie.dart';
import 'package:http/http.dart';

void main() async {
  final cep = '85960000';
  final cepRepositorie = CepRepositorie();

  final resposta = await cepRepositorie.buscarCep(cep);
  print(resposta.localidade);
  print(resposta.cep);
  print(resposta.bairro);
  print(resposta.uf);
  print(resposta.logradouro);
}
