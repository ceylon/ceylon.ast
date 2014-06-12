"An AST editor.
 There is one method per AST node; override the methods for which you need to change the AST,
 and leave the others untouched.
 
 The default operation for “bottom“ node types’ methods is to copy the node, editing the children.
 (The default operation for non-“bottom” node types’ methods is inherited from [[NarrowingTransformer]],
 see there.)
 By itself, an [[Editor]] will not actually edit the AST –
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
 (in this example, override [[transformBody]])."
shared abstract class Editor() extends NarrowingTransformer<Node>() {
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that) {
        // TODO switch on case types, call appropriate editSubclass(that) function
        throw Error("Not yet implemented");
    }
    shared actual default FloatLiteral transformFloatLiteral(FloatLiteral that)
            => that.copy();
    shared actual default Identifier transformIdentifier(Identifier that)
            => that.copy();
    shared actual default IntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => that.copy();
    shared actual default LIdentifier transformLIdentifier(LIdentifier that)
            => that.copy();
    shared actual default Literal transformLiteral(Literal that) {
        switch (that)
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is CharacterLiteral) { return transformCharacterLiteral(that); }
        case (is IntegerLiteral) { return transformIntegerLiteral(that); }
        case (is FloatLiteral) { return transformFloatLiteral(that); }
    }
    shared actual default Node transformNode(Node that) {
        // TODO switch on case types, call appropriate editSubclass(that) function
        throw Error("Not yet implemented");
    }
    shared actual default Outer transformOuter(Outer that)
            => that.copy();
    shared actual default Package transformPackage(Package that)
            => that.copy();
    shared actual default SelfReference transformSelfReference(SelfReference that) {
        switch (that)
        case (is This) { return transformThis(that); }
        case (is Super) { return transformSuper(that); }
        case (is Outer) { return transformOuter(that); }
        case (is Package) { return transformPackage(that); }
    }
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that.copy();
    shared actual default Super transformSuper(Super that)
            => that.copy();
    shared actual default This transformThis(This that)
            => that.copy();
    shared actual default Type transformType(Type that) {
        // TODO switch on case types, call appropriate editSubclass(that) function
        throw Error("Not yet implemented");
    }
    shared actual default TypeNameWithArguments transformTypeNameWithArguments(TypeNameWithArguments that)
            => that.copy();
    shared actual default UIdentifier transformUIdentifier(UIdentifier that)
            => that.copy();
}
