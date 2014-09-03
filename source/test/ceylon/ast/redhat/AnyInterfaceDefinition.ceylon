import ceylon.ast.core {
    AnyInterfaceDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyInterfaceDefinitionToCeylon,
    compileAnyInterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

shared object anyInterfaceDefinition satisfies AbstractTest<AnyInterfaceDefinition,JInterfaceDefinition> {
    compile = compileAnyInterfaceDefinition;
    fromCeylon = RedHatTransformer.transformAnyInterfaceDefinition;
    toCeylon = anyInterfaceDefinitionToCeylon;
    
    tests = [interfaceDefinition, dynamicInterfaceDefinition];
}
