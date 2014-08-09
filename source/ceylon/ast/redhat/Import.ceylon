import ceylon.ast.core {
    Import
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImport=Import
    }
}

"Converts a RedHat AST [[Import|JImport]] to a `ceylon.ast` [[Import]]."
shared Import importToCeylon(JImport \iimport) {
    return Import(fullPackageNameToCeylon(\iimport.importPath), importElementsToCeylon(\iimport.importMemberOrTypeList));
}

"Compiles the given [[code]] for an Import
 into an [[Import]] using the Ceylon compiler
 (more specifically, the rule for an `import`)."
shared Import? compileImport(String code) {
    if (exists jImport = createParser(code).importDeclaration()) {
        return importToCeylon(jImport);
    } else {
        return null;
    }
}
