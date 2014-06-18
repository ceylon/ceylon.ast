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
shared /* abstract */ class Editor() extends NarrowingTransformer<Node>() { // TODO make abstract again
    shared actual default BaseType transformBaseType(BaseType that)
            => that.copy();
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that) {
        assert (is CompilationUnit ret = super.transformCompilationUnit(that));
        return ret;
    }
    shared actual default FloatLiteral transformFloatLiteral(FloatLiteral that)
            => that.copy();
    shared actual default GroupedType transformGroupedType(GroupedType that)
            => that.copy();
    shared actual default Identifier transformIdentifier(Identifier that)
            => that.copy();
    shared actual default IterableType transformIterableType(IterableType that)
            => that.copy();
    shared actual default IntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => that.copy();
    shared actual default LIdentifier transformLIdentifier(LIdentifier that)
            => that.copy();
    shared actual default Literal transformLiteral(Literal that) {
        assert (is Literal ret = super.transformLiteral(that));
        return ret;
    }
    shared actual default Outer transformOuter(Outer that)
            => that.copy();
    shared actual default Package transformPackage(Package that)
            => that.copy();
    shared actual default QualifiedType transformQualifiedType(QualifiedType that)
            => that.copy();
    shared actual default SelfReference transformSelfReference(SelfReference that) {
        assert (is SelfReference ret = super.transformSelfReference(that));
        return ret;
    }
    shared actual default SimpleType transformSimpleType(SimpleType that) {
        assert (is SimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that.copy();
    shared actual default Super transformSuper(Super that)
            => that.copy();
    shared actual default This transformThis(This that)
            => that.copy();
    shared actual default Type transformType(Type that) {
        assert (is Type ret = super.transformType(that));
        return ret;
    }
    shared actual default TypeIsh transformTypeIsh(TypeIsh that) {
        assert (is TypeIsh ret = super.transformTypeIsh(that));
        return ret;
    }
    shared actual default TypeNameWithArguments transformTypeNameWithArguments(TypeNameWithArguments that)
            => that.copy();
    shared actual default UIdentifier transformUIdentifier(UIdentifier that)
            => that.copy();
    shared actual default VariadicType transformVariadicType(VariadicType that)
            => that.copy();
}
