// passo a passo:
// criar os include e namespace
// copiar e colar as funcoes
// ajeitar as funcoes coladas

#include <iostream>
#include "pilha.h"

using namespace std;

pilha::pilha()
{   
    tamanho = 0;
    Pilha = new int[Max];
}

pilha::~pilha()
{
    delete [] Pilha;
}

bool pilha:: cheio(){
    // if (tamanho == Max)
    // {
    //     return 1;
    // }
    // else
    // {
    //     return 0;
    // }
    return (tamanho == Max); // mais pratico
}
bool pilha::vazio(){
    return (tamanho == 0);
}
void pilha::adicionar(int item){
    if (cheio()){
            cout << "A pilha esta cheia!\n";
            cout << "Nao e possivel inserir este elemento!\n";
    } else{
            Pilha[tamanho] = item;
            tamanho++;
    }
}
void pilha::remover(){
    if (vazio()){
            cout << "A pilha esta vazia!\n";
            cout << "Nao e possivel remover!\n";
    } else{
            tamanho--;
    }
}
void pilha::imprimir(){
    cout << "Pilha: [ ";
    for (int i=0 ; i<tamanho ; i++){
            cout << Pilha[i] << " ";
    }
    cout << "]\n";
}
void pilha::tamanho_atual(){
    cout<< "O tamanho atual é: " << tamanho << endl;
}