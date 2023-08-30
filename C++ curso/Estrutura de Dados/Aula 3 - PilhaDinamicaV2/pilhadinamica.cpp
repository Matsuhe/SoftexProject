#include <iostream>
#include "pilhadinamica.h"
#include <cstddef> //NULL

using namespace std;

pilhadinamica::pilhadinamica() // construtor // dynamic stack
{
    topo = NULL;
}

pilhadinamica::~pilhadinamica() // destrutor
{
    TipoItem* NoTemp;
    while (topo != NULL) {
        NoTemp = topo;
        topo = topo->prox;
        delete NoTemp;
    }
}

bool pilhadinamica::estavazio() // isempty
{
    return (topo == NULL);
}

bool pilhadinamica::estacheio() // isfull
{
    TipoItem* NoNovo;
    try {
        NoNovo = new TipoItem;
        delete NoNovo;
        return false;
    } catch (bad_alloc exception) {
        return true;
    }
}

void pilhadinamica::inserir(int item) // push
{
    if (estacheio()) {
        cout << "A Pilha esta cheia!\n";
        cout << "Nao foi possivel inserir este elemento!\n";
    } else {
        TipoItem* NoNovo = new TipoItem;
        NoNovo->dados = item;
        NoNovo->prox = topo;
        topo = NoNovo;
    }
}

int pilhadinamica::remover(){
    if (estavazio()){
        cout << "A Pilha esta vazia!\n";
        cout << "Nao foi possivel remover nenhum elemento!\n";
        return 0;
    }else{
        TipoItem* NoTemp;
        NoTemp = topo;
        int item = topo->dados;
        topo = topo->prox;
        delete NoTemp;
        return item;
    }
}

// void pilhadinamica::imprimir() // print
// {
//     TipoItem* NoTemp = pilha.topo;
//     cout << "Pilha: [ ";
//     while (NoTemp != NULL) {
//         cout << NoTemp->dados << " ";
//         NoTemp = NoTemp->prox;
//     }
//     cout << "]\n";
// }

void pilhadinamica::imprimir() // print
{
    TipoItem* NoTemp = topo;
    cout << "Pilha: [ ";
    while (NoTemp != NULL) {
        cout << NoTemp->dados << " ";
        NoTemp = NoTemp->prox;
    }
    cout << "]\n";
}

