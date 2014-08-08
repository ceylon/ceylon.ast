import ceylon.ast.core {
    ImportWildcard
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportWildcard=ImportWildcard
    }
}

"Converts a RedHat AST [[ImportWildcard|JImportWildcard]] to a `ceylon.ast` [[ImportWildcard]]."
shared ImportWildcard importWildcardToCeylon(JImportWildcard importWildcard) {
    return ImportWildcard();
}

"Compiles the given [[code]] for an Import Wildcard
 into an [[ImportWildcard]] using the Ceylon compiler
 (more specifically, the rule for an `importWildcard`)."
shared ImportWildcard? compileImportWildcard(String code) {
    if (exists jImportWildcard = createParser(code).importWildcard()) {
        return importWildcardToCeylon(jImportWildcard);
    } else {
        return null;
    }
}
