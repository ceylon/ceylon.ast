import ceylon.ast.core {
    Dec,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAliasLiteral=AliasLiteral,
        JClassLiteral=ClassLiteral,
        JFunctionLiteral=FunctionLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JMemberLiteral=MemberLiteral,
        JMetaLiteral=MetaLiteral,
        JModuleLiteral=ModuleLiteral,
        JNewLiteral=NewLiteral,
        JPackageLiteral=PackageLiteral,
        JTypeLiteral=TypeLiteral,
        JTypeParameterLiteral=TypeParameterLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MetaLiteral|JMetaLiteral]] to a `ceylon.ast` [[Dec]]."
shared Dec decToCeylon(JMetaLiteral dec, Anything(JNode, Node) update = noop) {
    assert (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral|JValueLiteral|JFunctionLiteral|JNewLiteral|JModuleLiteral|JPackageLiteral dec);
    switch (dec)
    case (is JTypeLiteral) {
        if (is JNewLiteral dec) {
            return constructorDecToCeylon(dec, update);
        } else {
            return typeDecToCeylon(dec, update);
        }
    }
    case (is JMemberLiteral) { return memberDecToCeylon(dec, update); }
    case (is JPackageLiteral) { return packageDecToCeylon(dec, update); }
    case (is JModuleLiteral) { return moduleDecToCeylon(dec, update); }
}

"Parses the given [[code]] for a Dec
 into a [[Dec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared Dec? parseDec(String code, Anything(JNode, Node) update = noop) {
    if (exists jMetaLiteral = createParser(code).metaLiteral()) {
        return decToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
