import ceylon.ast.core {
    CompilationUnit,
    Declaration,
    Import
}
import ceylon.ast.redhat {
    RedHatTransformer,
    compilationUnitToCeylon,
    parseCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

shared object compilationUnit satisfies ConcreteTest<CompilationUnit,JCompilationUnit> {
    
    String->CompilationUnit construct(<String->Declaration>[] declarations, <String->Import>[] imports = [])
            => "``"".join(imports*.key)`` ``"".join(declarations*.key)``"->CompilationUnit(declarations*.item, imports*.item);
    
    shared String->CompilationUnit voidFunctionCompilationUnit = construct([functionDefinition.noopFunctionDefinition]);
    shared String->CompilationUnit nonemptyCompilationUnit = construct {
        imports = [\iimport.ceylonAstWildcardImport, \iimport.ceylonCollectionImport];
        declarations = [functionDefinition.nonemptyFunctionDefinition, valueDefinition.annotatedByValueDefinition];
    };
    
    parse = parseCompilationUnit;
    fromCeylon = RedHatTransformer.transformCompilationUnit;
    toCeylon = compilationUnitToCeylon;
    codes = [voidFunctionCompilationUnit, nonemptyCompilationUnit];
}
