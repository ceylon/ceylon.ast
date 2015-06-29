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
    GivenDec result;
    switch (jType)
    case (is JBaseType) {
        PackageQualifier? packageQualifier;
        if (jType.packageQualified) {
            value pq = PackageQualifier();
            update(jType, pq);
            packageQualifier = pq;
        } else {
            packageQualifier = null;
        }
        value decQualifier = DecQualifier([], packageQualifier);
        update(jType, decQualifier);
        result = GivenDec(uIdentifierToCeylon(jType.identifier, update), decQualifier);
    }
    case (is JQualifiedType) { result = GivenDec(uIdentifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
    update(givenDec, result);
    return result;
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
