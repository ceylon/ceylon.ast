"An AST editor.
 There is one method per AST node; override the methods for which you need to change the AST,
 and leave the others untouched.
 
 The default operation for all node types is to create a copy of the node, with editing results
 of the children as the new children. By itself, an [[Editor]] will not actually edit the AST –
 it’s only scaffolding that allows you to easily edit parts of the AST without having to bother with
 the deep nesting of the nodes.
 
 For example:
 ~~~
 class PrefixEditor(String prefix) extends Editor() {
     shared actual Identifier editIdentifier(Identifier that)
             => that.copy { name = prefix + that.name; };
 }
 ~~~
 will prepend `prefix` to every [[Identifier]] in the AST.
 
 Note that this deep copy of the AST can be expensive; if you know that you will not touch
 certain parts of the AST – for example, you only edit method names, and never instructions –
 you might want to override some methods to `return this` instead of a deep copy
 (in this example, override [[visitBody]])."
shared abstract class Editor() {
    shared default CharacterLiteral editCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared default CompilationUnit editCompilationUnit(CompilationUnit that) {
        // TODO switch on case types, call appropriate editSubclass(that) function
        throw Error("Not yet implemented");
    }
    shared default FloatLiteral editFloatLiteral(FloatLiteral that)
            => that.copy();
    shared default Identifier editIdentifier(Identifier that)
            => that.copy();
    shared default IntegerLiteral editIntegerLiteral(IntegerLiteral that)
            => that.copy();
    shared default LIdentifier editLIdentifier(LIdentifier that)
            => that.copy();
    shared default Literal editLiteral(Literal that) {
        switch (that)
        case (is StringLiteral) { return editStringLiteral(that); }
        case (is CharacterLiteral) { return editCharacterLiteral(that); }
        case (is IntegerLiteral) { return editIntegerLiteral(that); }
        case (is FloatLiteral) { return editFloatLiteral(that); } 
    }
    shared default Node editNode(Node that) {
        // TODO switch on case types, call appropriate editSubclass(that) function
        throw Error("Not yet implemented");
    }
    shared default Outer editOuter(Outer that)
            => that.copy();
    shared default Package editPackage(Package that)
            => that.copy();
    shared default SelfReference editSelfReference(SelfReference that) {
        switch (that)
        case (is This) { return editThis(that); }
        case (is Super) { return editSuper(that); }
        case (is Outer) { return editOuter(that); }
        case (is Package) { return editPackage(that); }
    }
    shared default StringLiteral editStringLiteral(StringLiteral that)
            => that.copy();
    shared default Super editSuper(Super that)
            => that.copy();
    shared default This editThis(This that)
            => that.copy();
    shared default UIdentifier editUIdentifier(UIdentifier that)
            => that.copy();
}
