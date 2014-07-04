"""A reference expression, that is, a detyped reference to a program element.
   
   Reference expressions may refer to:
   
   * a class, interface, alias, or type parameter ([[TypeDec]])
   * a function or value ([[MemberDec]])
   * a package or module ([[PackageDec]], [[MemberDec]]).
   
   Not to be confused with [[Meta]], which represents a *typed* reference.
   Simply speaking, if there’s a keyword (`` `class String` ``, `` `value system` ``),
   then it’s a [[Dec]], otherwise it’s a [[Meta]].
   
   Reference expressions are often used in annotations, e. g. [[see]]."""
shared abstract class Dec()
        of TypeDec
        extends Primary() {
}
