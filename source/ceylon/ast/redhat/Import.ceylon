import ceylon.ast.core {
    Import,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JImport=Import
    }
}

"Converts a RedHat AST [[Import|JImport]] to a `ceylon.ast` [[Import]]."
shared Import importToCeylon(JImport \iimport, Anything(JNode, Node) update = noop) {
    value result = Import(fullPackageNameToCeylon(\iimport.importPath, update), importElementsToCeylon(\iimport.importMemberOrTypeList, update));
    update(\iimport, result);
    return result;
}

"Parses the given [[code]] for an Import
 into an [[Import]] using the Ceylon compiler
 (more specifically, the rule for an `import`)."
shared Import? parseImport(String code, Anything(JNode, Node) update = noop) {
    if (exists jImport = createParser(code).importDeclaration()) {
        return importToCeylon(jImport, update);
    } else {
        return null;
    }
}
