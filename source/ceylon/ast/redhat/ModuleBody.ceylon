import ceylon.ast.core {
    ModuleBody,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyAttribute=AnyAttribute,
        JAttributeDeclaration=AttributeDeclaration,
        JImportModuleList=ImportModuleList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ImportModuleList|JImportModuleList]] to a `ceylon.ast` [[ModuleBody]]."
shared ModuleBody moduleBodyToCeylon(JImportModuleList moduleBody, Anything(JNode, Node) update = noop) {
    value result = ModuleBody(
        CeylonIterable(moduleBody.importModules).collect(propagateUpdate(moduleImportToCeylon, update)),
        CeylonIterable(moduleBody.constants).collect((JAnyAttribute constant) {
                assert (is JAttributeDeclaration constant);
                return valueDefinitionToCeylon(constant, update);
            })
    );
    update(moduleBody, result);
    return result;
}

"Parses the given [[code]] for a Module Body
 into a [[ModuleBody]] using the Ceylon compiler
 (more specifically, the rule for a `moduleBody`)."
shared ModuleBody? parseModuleBody(String code, Anything(JNode, Node) update = noop) {
    if (exists jImportModuleList = createParser(code).importModuleList()) {
        return moduleBodyToCeylon(jImportModuleList, update);
    } else {
        return null;
    }
}
