import ceylon.ast.core {
    Import,
    ModuleCompilationUnit,
    ModuleDescriptor
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleCompilationUnitToCeylon,
    parseModuleCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

shared object moduleCompilationUnit satisfies ConcreteTest<ModuleCompilationUnit,JCompilationUnit> {
    
    String->ModuleCompilationUnit construct(String->ModuleDescriptor moduleDescriptor, <String->Import>[] imports = [])
            => "``"".join(imports*.key)`` ``moduleDescriptor.key``"->ModuleCompilationUnit(moduleDescriptor.item, imports*.item);
    
    shared String->ModuleCompilationUnit ceylonAstCoreEmptyModuleCompilationUnit = construct(moduleDescriptor.ceylonAstCoreEmptyModuleDescriptor);
    
    parse = parseModuleCompilationUnit;
    fromCeylon = RedHatTransformer.transformModuleCompilationUnit;
    toCeylon = moduleCompilationUnitToCeylon;
    codes = [ceylonAstCoreEmptyModuleCompilationUnit];
}
