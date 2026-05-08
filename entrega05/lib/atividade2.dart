// Atividade 2 - Tratamento de erros em operações assíncronas
// Baseado em: https://dart.dev/codelabs/async-await#exercise-practice-handling-errors

// ---- Funções auxiliares simulando erro ----

class UserAuthorizationException implements Exception {
  final String message;
  UserAuthorizationException(this.message);

  @override
  String toString() => 'UserAuthorizationException: $message';
}

Future<String> fetchUsername() =>
    Future.delayed(Duration(milliseconds: 500), () {
      // Simula um erro de autorização
      throw UserAuthorizationException('Usuário não autorizado.');
    });

Future<String> fetchNewUsername() =>
    Future.delayed(Duration(milliseconds: 500), () => 'novo_usuario');

// ---- changeUsername ----
// Tenta buscar o username atual; se falhar, retorna o novo username como fallback.
Future<String> changeUsername() async {
  try {
    final current = await fetchUsername();
    return current;
  } on UserAuthorizationException catch (e) {
    // Captura o erro específico e retorna o novo username como fallback
    print('Erro capturado: $e');
    return await fetchNewUsername();
  }
}

// ---- addHello ----
// Adiciona 'Olá, ' antes do username. Usa try-catch genérico.
Future<String> addHello(String user) async {
  return 'Olá, $user';
}

// ---- greetUser ----
// Busca o username e prepend 'Olá, '.
Future<String> greetUser() async {
  try {
    final username = await changeUsername();
    return await addHello(username);
  } catch (e) {
    return 'Erro ao saudar: $e';
  }
}

// ---- main ----
Future<void> main() async {
  print('--- Atividade 2: Tratamento de Erros ---\n');

  // Teste direto de changeUsername (captura erro e usa fallback)
  final result = await changeUsername();
  print('Resultado de changeUsername: $result');

  // Teste de greetUser
  final greeting = await greetUser();
  print('Resultado de greetUser: $greeting');

  // Exemplo sem erro
  print('\n--- Sem erro ---');
  try {
    print('Aguardando operação...');
    await Future.delayed(Duration(milliseconds: 300));
    print('Operação concluída com sucesso.');
  } catch (e) {
    print('Erro: $e');
  } finally {
    print('Bloco finally sempre executado.');
  }
}
