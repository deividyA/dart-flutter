import 'package:dart_async/models/Cep.dart';
import 'package:http/http.dart';

class CepRepositorie {

  Future<Cep> buscarCep(String cep) async {
    final resposta = await get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (resposta.statusCode != 200) {
      throw Exception("Erro ao buscar Cep!!");
    }
    final respostaData = resposta.body;
    if (respostaData.isEmpty) {
      throw Exception("Cep vazio");
    }
    return Cep.fromJson(respostaData);
  }
}
