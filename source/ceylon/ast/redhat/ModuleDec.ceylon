import ceylon.ast.core {
    ModuleDec,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JModuleLiteral=ModuleLiteral
    }
}

"Converts a RedHat AST [[ModuleLiteral|JModuleLiteral]] to a `ceylon.ast` [[ModuleDec]]."
shared ModuleDec moduleDecToCeylon(JModuleLiteral moduleDec, Anything(JNode,Node) update = noop) {
    ModuleDec result;
    if (exists importPath = moduleDec.importPath, !importPath.identifiers.empty) {
        result = ModuleDec(fullPackageNameToCeylon(importPath, update));
    } else {
        // null importPath: `module`
        // non-null but empty importPath: typechecked `module`
        result = ModuleDec(null);
    }
    update(moduleDec, result);
    return result;
}

"Compiles the given [[code]] for a Module Dec
 into a [[ModuleDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ModuleDec? compileModuleDec(String code, Anything(JNode,Node) update = noop) {
    if (is JModuleLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return moduleDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
