/*
ATIVIDADE 4. Utilizando a classe Laptop do exercício anterior, crie 3 named
constructors. Cada um deve criar uma instância de Laptop que configure:
• um laptop para somente navegação na internet;
• um laptop para uso em escritório;
• um laptop para programação.
Você deve decidir quais configurações serão definidas em cada named
constructor. Por fim, crie instâncias de objetos Laptop utilizando cada um dos
named constructor e imprima seus valores no console.
*/

class Laptop {

  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);
  Laptop.internet(int id)
      : id = id,
        nome = "Laptop Básico",
        ram = 4,
        clockCpu = 2.0;
  Laptop.escritorio(int id)
      : id = id,
        nome = "Laptop Escritório",
        ram = 8,
        clockCpu = 2.5;
  Laptop.programacao(int id)
      : id = id,
        nome = "Laptop Programação",
        ram = 16,
        clockCpu = 3.2;

  void imprimirDetalhes() {
    print("ID: $id");
    print("Nome: $nome");
    print("RAM: ${ram}GB");
    print("Clock CPU: ${clockCpu}GHz");
    print("-------------------------");
  }
}

void main() {

  Laptop laptopInternet = Laptop.internet(1);
  Laptop laptopEscritorio = Laptop.escritorio(2);
  Laptop laptopProgramacao = Laptop.programacao(3);

  laptopInternet.imprimirDetalhes();
  laptopEscritorio.imprimirDetalhes();
  laptopProgramacao.imprimirDetalhes();

}