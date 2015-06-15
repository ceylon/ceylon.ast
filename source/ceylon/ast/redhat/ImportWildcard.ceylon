import ceylon.ast.core {
    ImportWildcard,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JImportWildcard=ImportWildcard
    }
}

"Converts a RedHat AST [[ImportWildcard|JImportWildcard]] to a `ceylon.ast` [[ImportWildcard]]."
shared ImportWildcard importWildcardToCeylon(JImportWildcard importWildcard, Anything(JNode,Node) update = noop) {
    value result = ImportWildcard();
    update(importWildcard, result);
    return result;
}

"Compiles the given [[code]] for an Import Wildcard
 into an [[ImportWildcard]] using the Ceylon compiler
 (more specifically, the rule for an `importWildcard`)."
shared ImportWildcard? compileImportWildcard(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportWildcard = createParser(code).importWildcard()) {
        return importWildcardToCeylon(jImportWildcard, update);
    } else {
        return null;
    }
}
