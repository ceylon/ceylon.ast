import ceylon.ast.core {
    Node,
    TypeMeta
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAliasLiteral=AliasLiteral,
        JClassLiteral=ClassLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JTypeLiteral=TypeLiteral,
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

"Converts a RedHat AST [[TypeLiteral|JTypeLiteral]] to a `ceylon.ast` [[TypeMeta]]."
shared TypeMeta typeMetaToCeylon(JTypeLiteral typeMeta, Anything(JNode, Node) update = noop) {
    "Must not be a reference expression"
    assert (!typeMeta is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral);
    value result = TypeMeta(typeToCeylon(typeMeta.type, update));
    update(typeMeta, result);
    return result;
}

"Parses the given [[code]] for a Type Meta
 into a [[TypeMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared TypeMeta? parseTypeMeta(String code, Anything(JNode, Node) update = noop) {
    if (is JTypeLiteral jMetaLiteral = createParser(code).metaLiteral(),
        !jMetaLiteral is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral) {
        return typeMetaToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
