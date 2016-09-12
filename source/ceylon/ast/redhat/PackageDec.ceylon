import ceylon.ast.core {
    Node,
    PackageDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPackageLiteral=PackageLiteral
    }
}

"Converts a RedHat AST [[PackageLiteral|JPackageLiteral]] to a `ceylon.ast` [[PackageDec]]."
shared PackageDec packageDecToCeylon(JPackageLiteral packageDec, Anything(JNode,Node) update = noop) {
    PackageDec result;
    if (exists importPath = packageDec.importPath, !importPath.identifiers.empty) {
        result = PackageDec(fullPackageNameToCeylon(importPath, update));
    } else {
        // null importPath: `package`
        // non-null but empty importPath: typechecked `package`
        result = PackageDec(null);
    }
    update(packageDec, result);
    return result;
}

"Parses the given [[code]] for a Package Dec
 into a [[PackageDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared PackageDec? parsePackageDec(String code, Anything(JNode,Node) update = noop) {
    if (is JPackageLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return packageDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
