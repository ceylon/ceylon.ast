import ceylon.ast.core {
    DecQualifier,
    GivenDec,
    Node,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeParameterLiteral|JTypeParameterLiteral]] to a `ceylon.ast` [[GivenDec]]."
shared GivenDec givenDecToCeylon(JTypeParameterLiteral givenDec, Anything(JNode,Node) update = noop) {
    assert (is JBaseType|JQualifiedType jType = givenDec.type);
    switch (jType)
    case (is JBaseType) { return GivenDec(uIdentifierToCeylon(jType.identifier, update), DecQualifier([], jType.packageQualified then PackageQualifier())); }
    case (is JQualifiedType) { return GivenDec(uIdentifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
}

"Compiles the given [[code]] for a Given Dec
 into a [[GivenDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared GivenDec? compileGivenDec(String code, Anything(JNode,Node) update = noop) {
    if (is JTypeParameterLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type is JBaseType) {
        return givenDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
