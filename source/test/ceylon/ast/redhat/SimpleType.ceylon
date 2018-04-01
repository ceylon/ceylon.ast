import ceylon.ast.core {
    SimpleType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    simpleTypeToCeylon,
    parseSimpleType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSimpleType=SimpleType
    }
}

shared object simpleType satisfies AbstractTest<SimpleType,JSimpleType> {
    parse = parseSimpleType;
    fromCeylon = RedHatTransformer.transformSimpleType;
    toCeylon = simpleTypeToCeylon;
    
    tests = [baseType, qualifiedType];
}
