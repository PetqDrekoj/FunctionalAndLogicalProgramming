#include <iostream>
#include "lista.h"
using namespace std;

bool inclusionOfAnElement(int el, Lista l)
{
	//									  { inclusionOfAnElement(el, l2l3...ln), if el!=l1
	//inclusionOfAnElement(el, l1l2...ln)={ true, if el=l1
	//						              {	false, if k=0

	if (l._prim == NULL)
		return false;
	else if (el == l._prim->e)
		return true;
	else {
		l._prim = l._prim->urm;
		inclusionOfAnElement(el, l);
	}
}

// test the inclusion of two sets
bool inclusion(Lista l1, Lista l2)
{
	//							     { true, if n=0 
	//inclusion(l1l2...ln,m1m2...mk)={ false, if inclusionOfAnElement(l1,m1m2...mk)=false
	//						         { inclusion(l2l3...ln,m1m2...mk), if inclusionOfAnElement(l1,m1m2...mk)=true

	if (l1._prim == NULL)
		return true;
	else if (inclusionOfAnElement(l1._prim->e, l2) == false)
		return false;
	else if (inclusionOfAnElement(l1._prim->e, l2) == true)
	{
		l1._prim = l1._prim->urm;
		inclusion(l1, l2);
	}
}

//eliminate all occurences of an element from a list
Lista eliminate(Lista l, int element, Lista empty)
{
	//						  { [], if n=0
	//eliminate(l1l2...ln,el)={ eliminate(l2l3...ln,el), if l1=el, n!=0
	//						  {	l1 U eliminate(l2l3...ln,el), if l1!=el, n!=0

	if (l._prim == NULL)
		return empty;
	else if (l._prim->e == element)
	{
		l._prim = l._prim->urm;
		eliminate(l, element, empty);
	}
	else if (l._prim->e != element)
	{
		PNod nod = new Nod();
		nod->e = l._prim->e;
		nod->urm = empty._prim;
		empty._prim = nod;

		l._prim = l._prim->urm;
		eliminate(l, element, empty);
	}
}


int main()
{
	Lista l, l2;
	l = creare();
	cout << endl;
	l2 = creare();
	l2 = eliminate(l, 1, l2);
	tipar(l2);
	//cout << inclusion(l, l2);
	cout << endl;

	system("pause");
	return 0;
}
