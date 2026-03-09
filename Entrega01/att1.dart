/*
ATIVIDADE 1. Crie um programa em Dart para um sistema de cadastro de equipamentos do
IFSP. Use `var` para declarar o nome do equipamento como "Impressora 3D", `String`
para o local como "Lab de Protótipos", e `dynamic` para o número de patrimônio,
inicialmente como `12345`. Em seguida, altere o valor de `patrimonio` para `"12345-A"`
(simulando uma mudança de formato). Por fim, imprima os valores e use o operador `is`
para mostrar o tipo atual de cada variável. Use comentários no código para explicar por que
Dart permite mudar o tipo de patrimonio, mas não de local
*/

void main() {
  // var: o Dart define automaticamente o tipo na primeira atribuição
  var nomeEquipamento = "Impressora 3D";

  // String: tipo definido explicitamente
  String local = "Lab de Protótipos";

  // dynamic: pode receber qualquer tipo de valor
  dynamic patrimonio = 12345;

  // Alterando o valor de patrimonio para outro tipo
  patrimonio = "12345-A";

  // Imprimindo os valores
  print("Equipamento: $nomeEquipamento");
  print("Local: $local");
  print("Patrimônio: $patrimonio");

  print("\nVerificando tipos:");

  // Operador 'is' verifica se a variável é de determinado tipo
  print("nomeEquipamento é String? ${nomeEquipamento is String}");
  print("local é String? ${local is String}");
  print("patrimonio é String? ${patrimonio is String}");
  print("patrimonio é int? ${patrimonio is int}");
}