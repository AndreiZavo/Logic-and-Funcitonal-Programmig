__author__ = 'Andrei Zavorodnic'

"""
Requirements:
    1.  
        a. Transform a list in a set.
        b. Determine the union of two sets. The sets are represented as lists.
"""

"""
Mathematical model:
    a) transformListToSet(l1, l2, .., ln) = {
                        (),                                  if list is empty
                        l1 U transformListToSet(l2, .., ln), if l1 not in (l2, .., ln)
                        transformListToSet(l2, .., ln),      otherwise
    
    b) unionOfTwoSets(a1, a2, .. an, b1, b2, .., bn) = {
                        (b1, b2, .., bn),                                if a is empty
                        a1 U unionOfTwoSets(a2, .., an, b1, b2, .., bn), if a1 not in (b1, b2, .., bn)
                        unionOfTwoSets(a2, .., an, b1, b2, .., bn),      otherwise
"""


class Node:
    def __init__(self, e):
        self.e = e
        self.urm = None


def newNode(data):
    new_node = Node(data)
    new_node.data = data
    new_node.next = None
    return new_node


class List:
    def __init__(self):
        self.prim = None


def listCreation():
    lista = List()
    lista.prim = listCreation_rec()
    return lista


def listCreation_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Node(x)
        nod.urm = listCreation_rec()
        return nod


def tipar(lista):
    tipar_rec(lista.prim)


def tipar_rec(nod):
    if nod is not None:
        print(nod.e, end=' ')
        tipar_rec(nod.urm)


def searchElementInList(nod, val):
    if nod is None:
        return False
    if nod.e == val:
        return True
    return searchElementInList(nod.urm, val)


def addElementToList(nod, val):
    if nod is None:
        return newNode(val)
    else:
        nod.urm = addElementToList(nod.urm, val)
    return nod


# a)
def transformListToSet(node, list_as_set):
    if node is None:
        return list_as_set
    elif not searchElementInList(node.urm, node.e):
        addElementToList(list_as_set.prim, node.e)
        return transformListToSet(node.urm, list_as_set)
    else:
        return transformListToSet(node.urm, list_as_set)


# b)
def unionOfTwoSets(nodeA, listB):
    if nodeA is None:
        return listB
    elif not searchElementInList(listB.prim, nodeA.e):
        addElementToList(listB.prim, nodeA.e)
        return unionOfTwoSets(nodeA.urm, listB)
    else:
        return unionOfTwoSets(nodeA.urm, listB)


if __name__ == '__main__':
    print("Part a)\n")
    print("First list:\n")
    lista = listCreation()
    print("Second list:\n")
    list_as_set = listCreation()
    list_as_set = transformListToSet(lista.prim, list_as_set)
    print("Second list as a set:", end=' ')
    tipar(list_as_set)
    print("\nPart b)")
    print("Union of the two lists: ", end=' ')
    union_list = unionOfTwoSets(lista.prim, list_as_set)
    tipar(union_list)
