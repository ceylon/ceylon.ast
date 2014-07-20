import ceylon.ast.core {
    Dec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAliasLiteral=AliasLiteral,
        JClassLiteral=ClassLiteral,
        JFunctionLiteral=FunctionLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JMetaLiteral=MetaLiteral,
        JModuleLiteral=ModuleLiteral,
        JPackageLiteral=PackageLiteral,
        JTypeParameterLiteral=TypeParameterLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MetaLiteral|JMetaLiteral]] to a `ceylon.ast` [[Dec]]."
shared Dec decToCeylon(JMetaLiteral dec) {
    assert (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral|JValueLiteral|JFunctionLiteral|JModuleLiteral|JPackageLiteral dec);
    switch (dec)
    case (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JValueLiteral|JFunctionLiteral) {
        "Not yet implemented!" // TODO implement
        assert (false);
    }
    case (is JTypeParameterLiteral) { return givenDecToCeylon(dec); }
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
