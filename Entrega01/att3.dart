/*
ATIVIDADE 3. Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes.

*/

class Laptop{

  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  void imprimirDetalhes() {
    print("ID: $id");
    print("Nome: $nome");
    print("RAM: ${ram}GB");
    print("Clock CPU: ${clockCpu}GHz");
    print("-------------------------");
  }

}

void main() {
  Laptop laptop1 = Laptop(1, "Dell XPS 13", 16, 3.5);
  Laptop laptop2 = Laptop(2, "MacBook Pro", 32, 3.8);
  Laptop laptop3 = Laptop(3, "Lenovo ThinkPad", 8, 2.5);

  laptop1.imprimirDetalhes();
  laptop2.imprimirDetalhes();
  laptop3.imprimirDetalhes();
}