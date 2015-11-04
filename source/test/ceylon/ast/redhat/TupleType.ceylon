import ceylon.ast.core {
    TupleType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tupleTypeToCeylon,
    compileTupleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTupleType=TupleType,
        JSequenceType=SequenceType
    }
}

shared object tupleType satisfies AbstractTest<TupleType,JTupleType|JSequenceType> {
    compile = compileTupleType;
    fromCeylon = RedHatTransformer.transformTupleType;
    toCeylon = tupleTypeToCeylon;
    
    tests = [listTupleType, lengthTupleType];
}
