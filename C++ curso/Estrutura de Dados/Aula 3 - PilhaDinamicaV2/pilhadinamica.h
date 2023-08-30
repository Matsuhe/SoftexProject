#ifndef PILHADINAMICA_H
#define PILHADINAMICA_H

typedef struct TipoItem {
    int dados;
    struct TipoItem* prox;
} TipoItem;


class pilhadinamica {
private:
    TipoItem *topo;

public:
    pilhadinamica();             // construtor //dynamic stack
    ~pilhadinamica();            // destrutor
    bool estavazio();            // isempty
    bool estacheio();            // tem memória //isfull
    void inserir(int item);      // push
    int remover();          // pop
    void imprimir();             // print
};

#endif /* PILHADINAMICA_H */

