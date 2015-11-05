import ceylon.ast.core {
    SimpleType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    simpleTypeToCeylon,
    compileSimpleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSimpleType=SimpleType
    }
}

shared object simpleType satisfies AbstractTest<SimpleType,JSimpleType> {
    compile = compileSimpleType;
    fromCeylon = RedHatTransformer.transformSimpleType;
    toCeylon = simpleTypeToCeylon;
    
    tests = [baseType, qualifiedType];
}
