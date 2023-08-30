#include <iostream>

using namespace std;

//typedef int TipoItem;

typedef struct Fila
{
    int item;
    Fila *prox;
};


class fila
{
    private:
        Fila *inicio;
        Fila *fim;
    public:
        fila(/* args */);
        ~fila();
        bool estavazia();
        void inserir(int item);
        void remover();
        void imprimir();

};


