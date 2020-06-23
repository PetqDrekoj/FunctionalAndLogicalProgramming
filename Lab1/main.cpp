#include <iostream>
#include "lista.h"
using namespace std;

void afiseazaLista(PNod nodCurent)
{
    if (nodCurent != NULL) cout << nodCurent->e << ' ';
    else afiseazaLista(nodCurent->urm);

}

void adaugaLaFinal(Nod*& nodCurent, TElem elem)
{
    if(nodCurent->urm!=NULL) adaugaLaFinal(nodCurent->urm, elem);
    else {nodCurent->urm = new Nod; nodCurent->urm->e = elem; nodCurent->urm->urm  = NULL;}
}

Lista recA(PNod nodCurent)
{
    if(nodCurent->urm == NULL) {Lista l; adaugaLaFinal(l._prim,nodCurent->e); return l;}
    else if (nodCurent->urm != NULL) { adaugaLaFinal(recA(nodCurent->urm)._prim,nodCurent->e); return l;}
}

Lista punctulA(Lista listaInitiala)
{
    listaInitiala = recA(listaInitiala._prim);
    afiseazaLista(listaInitiala);
}




TElem recB(PNod nodCurent, TElem elementMaxim)
{
    if(nodCurent == NULL) return elementMaxim;
    else if(nodCurent->e > elementMaxim || elementMaxim == NULL) return recB(nodCurent->urm,nodCurent->e);
    else return recB(nodCurent->urm, elementMaxim);
}

TElem punctulB(Lista lista)
{
    TElem elemMaxim = NULL;
    return recB(Lista._prim, elemMaxim);
}
int main()
{
    Lista l;
    l = creare();

}
