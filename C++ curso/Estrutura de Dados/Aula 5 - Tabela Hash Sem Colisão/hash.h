#include <iostream>
#include "aluno.h"

class Hash{
    private:
    int FuncaoHash(Aluno aluno);
    int max_itens; // quantos elementos no max que irei colocar no vetor
    int max_posicoes; // tamanho do vetor
    int quant_itens; // quantidade de itens atuais
    Aluno* estrutura; // vetor de alunos 

    public:
    Hash(int tam_vetor, int max);// construtor
    ~Hash(); // destrutor
    bool estacheio();
    int obterTamanhoAtual();
    void inserir(Aluno aluno);
    void deletar(Aluno aluno);
    void buscar(Aluno& aluno, bool& busca);
    void imprimir();
};
