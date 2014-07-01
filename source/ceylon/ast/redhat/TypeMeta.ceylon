import ceylon.ast.core {
    TypeMeta
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
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[TypeLiteral|JTypeLiteral]] to a `ceylon.ast` [[TypeMeta]]."
shared TypeMeta typeMetaToCeylon(JTypeLiteral typeMeta) {
    "Must be unqualified"
    assert (!typeMeta.objectExpression exists);
    "Must not be a reference expression"
    assert (!typeMeta is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral);
    return TypeMeta(typeToCeylon(typeMeta.type));
}

"Compiles the given [[code]] for a Type Meta
 into a [[TypeMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared TypeMeta? compileTypeMeta(String code) {
    if (is JTypeLiteral jMetaLiteral = createParser(code).metaLiteral(),
        !jMetaLiteral.objectExpression exists,
        !jMetaLiteral is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral) {
        return typeMetaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
