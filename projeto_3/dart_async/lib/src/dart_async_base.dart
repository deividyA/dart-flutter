// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
void main() {
  print('teste 1');
  final str1 = mostrarNome();
  str1.then(print).catchError(print);
  final str2 = mostrarNomeComAsync();
  str2.then(print);
}
Future<String> mostrarNome() {
  return Future.value('Resposta Futuro');
}

Future<String> mostrarNomeComAsync() async {
  return Future.value('Resposta Futuro async');
}
