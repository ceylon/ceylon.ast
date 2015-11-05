import ceylon.ast.core {
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    primaryTypeToCeylon,
    compilePrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object primaryType satisfies AbstractTest<PrimaryType,JStaticType> {
    compile = compilePrimaryType;
    fromCeylon = RedHatTransformer.transformPrimaryType;
    toCeylon = primaryTypeToCeylon;
    
    tests = [simpleType, tupleType, iterableType, groupedType, optionalType, sequentialType, callableType];
}
