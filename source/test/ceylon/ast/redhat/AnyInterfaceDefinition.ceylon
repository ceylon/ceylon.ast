import ceylon.ast.core {
    AnyInterfaceDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyInterfaceDefinitionToCeylon,
    parseAnyInterfaceDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInterfaceDefinition=InterfaceDefinition
    }
}

shared object anyInterfaceDefinition satisfies AbstractTest<AnyInterfaceDefinition,JInterfaceDefinition> {
    parse = parseAnyInterfaceDefinition;
    fromCeylon = RedHatTransformer.transformAnyInterfaceDefinition;
    toCeylon = anyInterfaceDefinitionToCeylon;
    
    tests = [interfaceDefinition, dynamicInterfaceDefinition];
}
