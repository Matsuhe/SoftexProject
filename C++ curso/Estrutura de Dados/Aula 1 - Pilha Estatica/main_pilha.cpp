#include <iostream>
#include "pilha.h"

using namespace std;

int main(){
    pilha pilha1;
    int item;
    int opcao;
    cout << "Programa gerador de pilha:\n";
    do {
        cout << "Digite 0 para parar o programa!\n";
        cout << "Digite 1 para inserir um elemento!\n";
        cout << "Digite 2 para remover um elemento!\n";
        cout << "Digite 3 para imprimir a pilha!\n";
        cin >> opcao;
        if (opcao == 1){
            cout << "Digite o elemento a ser inserido:\n";
            cin >> item;
            pilha1.adicionar(item);
        } else if (opcao == 2){
            pilha1.remover();
            cout << "Ultimo Elemento Removido" << endl;
        } else if (opcao == 3){
            pilha1.imprimir();
        }

    } while(opcao != 0);

    return 0;
}

