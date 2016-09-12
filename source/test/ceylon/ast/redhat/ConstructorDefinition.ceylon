import ceylon.ast.core {
    ConstructorDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    constructorDefinitionToCeylon,
    parseConstructorDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JConstructor=Constructor,
        JEnumerated=Enumerated
    }
}

shared object constructorDefinition satisfies AbstractTest<ConstructorDefinition,JConstructor|JEnumerated> {
    parse = parseConstructorDefinition;
    fromCeylon = RedHatTransformer.transformConstructorDefinition;
    toCeylon = constructorDefinitionToCeylon;
    
    tests = [callableConstructorDefinition, valueConstructorDefinition];
}
