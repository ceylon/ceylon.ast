import ceylon.ast.core {
    PackageDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPackageLiteral=PackageLiteral
    }
}

"Converts a RedHat AST [[PackageLiteral|JPackageLiteral]] to a `ceylon.ast` [[PackageDec]]."
shared PackageDec packageDecToCeylon(JPackageLiteral packageDec) {
    return PackageDec(fullPackageNameToCeylon(packageDec.importPath));
}

"Compiles the given [[code]] for a Package Dec
 into a [[PackageDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared PackageDec? compilePackageDec(String code) {
    if (is JPackageLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return packageDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
