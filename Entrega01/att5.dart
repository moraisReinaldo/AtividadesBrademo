/*
ATIVIDADE 5. Escreva um programa de cadastro de residências em um portal
de vendas em Dart. Para tal, siga as instruções a seguir:
• Crie uma classe House com as propriedades int id, String name e double
price;
• Implemente um construtor que utilize o this para inicializar os atributos.
• Solicite ao usuário que digite os dados (id, name e price) de 3 casas;
• Crie os objetos da classe com os dados informados e adicione-os a uma
lista;
• Após a criação, use cascade notation (..) para alterar o nome de cada
casa, adicionando o sufixo "(Cadastrada)".
• Use um for-in para imprimir todos os detalhes das casas cadastradas.
Dica: Use stdin.readLineSync() e lembre-se de converter os dados com
int.parse() e double.parse()

*/

import 'dart:io';

class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);

  void imprimirDetalhes() {
    print("ID: $id");
    print("Name: $name");
    print("Price: \$${price.toStringAsFixed(2)}");
    print("-------------------------");
  }
}

void main() {
  List<House> houses = [];

  for (int i = 0; i < 3; i++) {
    print("Digite os dados da casa ${i + 1}:");
    print("ID:");
    int id = int.parse(stdin.readLineSync()!);
    print("Name:");
    String name = stdin.readLineSync()!;
    print("Price:");
    double price = double.parse(stdin.readLineSync()!);

    House house = House(id, name, price);
    house..name += " (Cadastrada)";
    houses.add(house);
  }

  print("\nCasas cadastradas:");
  for (var house in houses) {
    house.imprimirDetalhes();
  }
}


