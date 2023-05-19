void main() async {
  print('teste 1');
  final str1 = await mostrarNome();
  print(str1);
  final str2 = mostrarNomeComAsync();
  str2.then(print);
}
Future<String> mostrarNome() async {
  await Future.delayed(Duration(seconds: 5));
  return Future.value('Resposta Futuro');
}

Future<String> mostrarNomeComAsync() async {
  return Future.value('Resposta Futuro async');
}
