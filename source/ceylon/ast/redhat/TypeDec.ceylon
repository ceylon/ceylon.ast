import ceylon.ast.core {
    Node,
    TypeDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAliasLiteral=AliasLiteral,
        JClassLiteral=ClassLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JTypeLiteral=TypeLiteral,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeLiteral|JTypeLiteral]] to a `ceylon.ast` [[TypeDec]]."
shared TypeDec typeDecToCeylon(JTypeLiteral typeDec, Anything(JNode,Node) update = noop) {
    "Must be a Dec, not a Meta"
    assert (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral typeDec);
    switch (typeDec)
    case (is JClassLiteral) { return classDecToCeylon(typeDec, update); }
    case (is JInterfaceLiteral) { return interfaceDecToCeylon(typeDec, update); }
    case (is JAliasLiteral) { return aliasDecToCeylon(typeDec, update); }
    case (is JTypeParameterLiteral) { return givenDecToCeylon(typeDec, update); }
}

"Parses the given [[code]] for a Type Dec
 into a [[TypeDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared TypeDec? parseTypeDec(String code, Anything(JNode,Node) update = noop) {
    if (is JTypeLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return typeDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
