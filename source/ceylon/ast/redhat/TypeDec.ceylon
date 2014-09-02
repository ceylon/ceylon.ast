import ceylon.ast.core {
    TypeDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAliasLiteral=AliasLiteral,
        JClassLiteral=ClassLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JTypeLiteral=TypeLiteral,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeLiteral|JTypeLiteral]] to a `ceylon.ast` [[TypeDec]]."
shared TypeDec typeDecToCeylon(JTypeLiteral typeDec) {
    "Must be a Dec, not a Meta"
    assert (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral typeDec);
    switch (typeDec)
    case (is JClassLiteral) { return classDecToCeylon(typeDec); }
    case (is JInterfaceLiteral) { return interfaceDecToCeylon(typeDec); }
    case (is JAliasLiteral) {
        throw AssertionError("Alias decs not implemented yet"); // TODO implement alias decs
    }
    case (is JTypeParameterLiteral) { return givenDecToCeylon(typeDec); }
}

"Compiles the given [[code]] for a Type Dec
 into a [[TypeDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared TypeDec? compileTypeDec(String code) {
    if (is JTypeLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return typeDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
