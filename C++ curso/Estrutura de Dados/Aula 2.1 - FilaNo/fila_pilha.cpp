#include <iostream>
#include "fila.h"

int main() {
    fila fila;
    int item;
    int opcao;
    std::cout << "Programa gerador de fila:\n";

    do {
        std::cout << "Digite 0 para parar o programa!\n";
        std::cout << "Digite 1 para inserir um elemento!\n";
        std::cout << "Digite 2 para remover um elemento!\n";
        std::cout << "Digite 3 para imprimir a fila!\n";
        std::cin >> opcao;

        if (opcao == 1) {
            std::cout << "Digite o elemento a ser inserido:\n";
            std::cin >> item;
            fila.inserir(item);
        } else if (opcao == 2) {
            fila.remover();
            std::cout << "Elemento removido: "  << std::endl;
        } else if (opcao == 3) {
            fila.imprimir();
        }

    } while (opcao != 0);

    return 0;
}
