#include <iostream>
#include "lista.h"
using namespace std;

void adaugareFinal(Nod *&p, TElem element)
{
	if (p == NULL) { p = new Nod(); p->urm = NULL; p->e = element; }
	else if (p->urm == NULL) { p->urm = new Nod(); p->urm->urm = NULL; p->urm->e = element; }
	else adaugareFinal(p->urm, element);
}

void AfisareLista(PNod p)
{
	if (p == NULL);
	else { cout << p->e << ' '; AfisareLista(p->urm); }
}

///  MaximumElementOfAList(l1..ln, maxm) = { maxm , n = 0
///											 MaximumElementOfAList(l2...ln,l1), l1 > maxm
///											 MaximumElementOfAList(l2...ln,maxm), otherwise }
int MaximumElementOfAList(Lista l, TElem maxm)
{
	if (l._prim == NULL) return maxm;
	else if (l._prim->e > maxm) { maxm = l._prim->e; l._prim = l._prim->urm; return MaximumElementOfAList(l, maxm); }
	else { l._prim = l._prim->urm; return MaximumElementOfAList(l, maxm); }
}

///  InvertList(l1...ln) = { [] , n = 0
///							 InvertList(l2..ln) + l1 }
///
Lista InvertList(Lista l)
{
	if (l._prim == NULL) return l;
	else {
		TElem element = l._prim->e;
		l._prim = l._prim->urm;
		l = InvertList(l);
		adaugareFinal(l._prim, element);
		return l;
	}
}

int main()
{
	Lista l;
	l = creare();
	cout << "\nmaximul este " << MaximumElementOfAList(l, 0) << '\n';
	Lista lInvers = InvertList(l);
	cout << "lista inversa este: \n";
	AfisareLista(lInvers._prim);
}
