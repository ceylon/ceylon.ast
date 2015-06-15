import ceylon.ast.core {
    AnyCompilationUnit,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[AnyCompilationUnit]]."
shared AnyCompilationUnit anyCompilationUnitToCeylon(JCompilationUnit anyCompilationUnit, Anything(JNode,Node) update = noop) {
    AnyCompilationUnit result;
    if (!anyCompilationUnit.declarations.empty) {
        result = compilationUnitToCeylon(anyCompilationUnit, update);
    } else if (!anyCompilationUnit.packageDescriptors.empty) {
        result = packageCompilationUnitToCeylon(anyCompilationUnit, update);
    } else if (!anyCompilationUnit.moduleDescriptors.empty) {
        result = moduleCompilationUnitToCeylon(anyCompilationUnit, update);
    } else {
        // an empty compilation unit is a regular compilation unit
        result = compilationUnitToCeylon(anyCompilationUnit, update);
    }
    update(anyCompilationUnit, result);
    return result;
}

"Compiles the given [[code]] for Any Compilation Unit
 into an [[AnyCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared AnyCompilationUnit? compileAnyCompilationUnit(String code, Anything(JNode,Node) update = noop) {
    if (exists jCompilationUnit = createParser(code).compilationUnit()) {
        return anyCompilationUnitToCeylon(jCompilationUnit, update);
    } else {
        return null;
    }
}
