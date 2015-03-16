import ceylon.ast.core {
    AliasDec,
    DecQualifier,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAliasLiteral=AliasLiteral,
        JBaseType=BaseType,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[AliasLiteral|JAliasLiteral]] to a `ceylon.ast` [[AliasDec]]."
shared AliasDec aliasDecToCeylon(JAliasLiteral aliasDec) {
    assert (is JBaseType|JQualifiedType jType = aliasDec.type);
    switch (jType)
    case (is JBaseType) { return AliasDec(uIdentifierToCeylon(jType.identifier), DecQualifier([], jType.packageQualified then PackageQualifier())); }
    case (is JQualifiedType) { return AliasDec(uIdentifierToCeylon(jType.identifier), decQualifierToCeylon(jType.outerType)); }
}

"Compiles the given [[code]] for an Alias Dec
 into an [[AliasDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared AliasDec? compileAliasDec(String code) {
    if (is JAliasLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return aliasDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
