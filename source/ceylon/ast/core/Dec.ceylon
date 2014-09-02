"""A reference expression, that is, a detyped reference to a program element.
   
   Reference expressions may refer to:
   
   * a class, interface, alias, or type parameter ([[TypeDec]])
   * a function or value ([[MemberDec]])
   * a package or module ([[PackageDec]], [[ModuleDec]]).
   
   Not to be confused with [[Meta]], which represents a *typed* reference.
   Simply speaking, if there’s a keyword (`` `class String` ``, `` `value system` ``),
   then it’s a [[Dec]], otherwise it’s a [[Meta]].
   
   Reference expressions are often used in annotations, e. g. [[see]]."""
shared abstract class Dec()
        of TypeDec | PackageDec | ModuleDec
        extends Primary() {
    "The keyword of the declaration literal, that is:
     
     - `class` for a [[ClassDec]],
     - `interface` for an [[InterfaceDec]],
     - `alias` for an [[AliasDec]],
     - `given` for a [[GivenDec]],
     - `value` for a [[ValueDec]],
     - `function` for a [[FunctionDec]],
     - `package` for a [[PackageDec]], or
     - `module` for a [[ModuleDec]]."
    shared formal String keyword;
}
