import ceylon.ast.core {
    ModuleBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModuleList=ImportModuleList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ImportModuleList|JImportModuleList]] to a `ceylon.ast` [[ModuleBody]]."
shared ModuleBody moduleBodyToCeylon(JImportModuleList moduleBody) {
    return ModuleBody(CeylonIterable(moduleBody.importModules).collect(moduleImportToCeylon));
}

"Compiles the given [[code]] for a Module Body
 into a [[ModuleBody]] using the Ceylon compiler
 (more specifically, the rule for a `moduleBody`)."
shared ModuleBody? compileModuleBody(String code) {
    if (exists jImportModuleList = createParser(code).importModuleList()) {
        return moduleBodyToCeylon(jImportModuleList);
    } else {
        return null;
    }
}
