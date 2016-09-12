import ceylon.ast.core {
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    primaryTypeToCeylon,
    parsePrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object primaryType satisfies AbstractTest<PrimaryType,JStaticType> {
    parse = parsePrimaryType;
    fromCeylon = RedHatTransformer.transformPrimaryType;
    toCeylon = primaryTypeToCeylon;
    
    tests = [simpleType, tupleType, iterableType, groupedType, optionalType, sequentialType, callableType];
}
