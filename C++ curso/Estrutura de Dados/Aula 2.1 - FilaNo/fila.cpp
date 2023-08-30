#include <iostream>
#include "fila.h"
using namespace std;

fila::fila(/* args */)
{
    inicio = nullptr;
    fim = nullptr;
}

fila::~fila()
{
    while (inicio != nullptr) {
        Fila* aux = inicio;
        inicio = inicio->prox;
        delete aux;
    }
    fim = nullptr;
}

bool fila:: estavazia(){
    return (inicio == nullptr);
}
void fila::inserir(int item){
    Fila *novo = new Fila;
    novo->item = item;
    novo->prox = nullptr;
    if (estavazia()) {
        inicio = novo;
    } else {
        fim->prox = novo;
    }
    fim = novo;
}
void fila::remover(){
    if (estavazia()) {
        std::cout << "A fila está vazia!\n";
    }else{
        Fila *aux = inicio;
        inicio = inicio->prox;
        if (inicio == nullptr){
                fim = nullptr;
        }
        delete aux;
    }
}

void fila::imprimir(){
    std::cout << "Fila: [ ";
    Fila* aux = inicio;
    while (aux != nullptr) {
        std::cout << aux->item << " ";
        aux = aux->prox;
    }
    std::cout << "]\n";
}