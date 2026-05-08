// Atividade 1 - Prática com async e await
// Baseado em: https://dart.dev/codelabs/async-await#exercise-practice-using-async-and-await

// ---- Funções auxiliares simulando operações assíncronas ----

Future<String> fetchRole() =>
    Future.delayed(Duration(milliseconds: 500), () => 'administrador');

Future<int> fetchLoginAmount() =>
    Future.delayed(Duration(milliseconds: 500), () => 42);

// ---- Parte 1: reportUserRole ----
// Retorna uma String no formato: 'Papel do usuário: <papel>'
Future<String> reportUserRole() async {
  final role = await fetchRole();
  return 'Papel do usuário: $role';
}

// ---- Parte 2: reportLogins ----
// Retorna uma String no formato: 'Total de logins: <quantidade>'
Future<String> reportLogins() async {
  final logins = await fetchLoginAmount();
  return 'Total de logins: $logins';
}

// ---- main ----
Future<void> main() async {
  print(await reportUserRole());
  print(await reportLogins());
}
