import ceylon.ast.core {
    ModuleDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JModuleLiteral=ModuleLiteral
    }
}

"Converts a RedHat AST [[ModuleLiteral|JModuleLiteral]] to a `ceylon.ast` [[ModuleDec]]."
shared ModuleDec moduleDecToCeylon(JModuleLiteral moduleDec) {
    return ModuleDec(fullPackageNameToCeylon(moduleDec.importPath));
}

"Compiles the given [[code]] for a Module Dec
 into a [[ModuleDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ModuleDec? compileModuleDec(String code) {
    if (is JModuleLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return moduleDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
