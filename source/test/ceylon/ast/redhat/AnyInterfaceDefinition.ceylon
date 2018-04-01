import ceylon.ast.core {
    AnyInterfaceDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyInterfaceDefinitionToCeylon,
    parseAnyInterfaceDefinition
}
import org.eclipse.ceylon.compiler.typechecker.tree {
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
