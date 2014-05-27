"Abstract superclass of all expression nodes."
// TODO document the expression hierarchy as soon as some members of that hierarchy are actually implemented
shared abstract class Expression(children) extends Node(children) 
/* TODO case types */ {
    shared actual Expression[] children;
}
