import ceylon.ast.core {
    Dec
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared Dec decToCeylon(JMetaLiteral dec) {
    assert (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral|JValueLiteral|JFunctionLiteral|JNewLiteral|JModuleLiteral|JPackageLiteral dec);
    switch (dec)
    case (is JTypeLiteral) {
        if (is JNewLiteral dec) { return constructorDecToCeylon(dec); }
        else { return typeDecToCeylon(dec); }
    }
    case (is JMemberLiteral) { return memberDecToCeylon(dec); }
    case (is JPackageLiteral) { return packageDecToCeylon(dec); }
    case (is JModuleLiteral) { return moduleDecToCeylon(dec); }
}

"Compiles the given [[code]] for a Dec
 into a [[Dec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared Dec? compileDec(String code) {
    if (exists jMetaLiteral = createParser(code).metaLiteral()) {
        return decToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
