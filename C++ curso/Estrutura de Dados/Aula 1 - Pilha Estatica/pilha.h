//passo a passo 
// 1º incluir os include
// 2º passo criar a classe pilha
// 3º Neste caso será estatica
// 4º funcoes a fazer: construtor, destrutor, cheio, vazio
//                     adicionar , remover, imprimir
#include <iostream>

using namespace std;
const int Max= 100;

class pilha
{
    private:
        int tamanho;
        int *Pilha;

    public:
        pilha(/* args */);
        ~pilha();
        bool cheio();
        bool vazio();
        void adicionar(int item);
        void remover();
        void imprimir();
        void tamanho_atual();
};




