import ceylon.ast.core {
    AliasDec,
    DecQualifier,
    Node,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAliasLiteral=AliasLiteral,
        JBaseType=BaseType,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[AliasLiteral|JAliasLiteral]] to a `ceylon.ast` [[AliasDec]]."
shared AliasDec aliasDecToCeylon(JAliasLiteral aliasDec, Anything(JNode,Node) update = noop) {
    assert (is JBaseType|JQualifiedType jType = aliasDec.type);
    switch (jType)
    case (is JBaseType) { return AliasDec(uIdentifierToCeylon(jType.identifier, update), DecQualifier([], jType.packageQualified then PackageQualifier())); }
    case (is JQualifiedType) { return AliasDec(uIdentifierToCeylon(jType.identifier, update), decQualifierToCeylon(jType.outerType, update)); }
}

"Compiles the given [[code]] for an Alias Dec
 into an [[AliasDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared AliasDec? compileAliasDec(String code, Anything(JNode,Node) update = noop) {
    if (is JAliasLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return aliasDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
