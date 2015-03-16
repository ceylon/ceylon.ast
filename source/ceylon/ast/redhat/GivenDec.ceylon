import ceylon.ast.core {
    DecQualifier,
    GivenDec,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeParameterLiteral|JTypeParameterLiteral]] to a `ceylon.ast` [[GivenDec]]."
shared GivenDec givenDecToCeylon(JTypeParameterLiteral givenDec) {
    assert (is JBaseType|JQualifiedType jType = givenDec.type);
    switch (jType)
    case (is JBaseType) { return GivenDec(uIdentifierToCeylon(jType.identifier), DecQualifier([], jType.packageQualified then PackageQualifier())); }
    case (is JQualifiedType) { return GivenDec(uIdentifierToCeylon(jType.identifier), decQualifierToCeylon(jType.outerType)); }
}

"Compiles the given [[code]] for a Given Dec
 into a [[GivenDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared GivenDec? compileGivenDec(String code) {
    if (is JTypeParameterLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type is JBaseType) {
        return givenDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
