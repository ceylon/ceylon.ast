import ceylon.ast.core {
    PrimaryType,
    SequentialType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    sequentialTypeToCeylon,
    compileSequentialType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequenceType=SequenceType
    }
}

shared object sequentialType satisfies ConcreteTest<SequentialType,JSequenceType> {
    
    String->SequentialType construct(String->PrimaryType elem)
            => "``elem.key``[]"->SequentialType(elem.item);
    
    shared String->SequentialType stringSequentialType = construct(baseType.stringType);
    shared String->SequentialType iterableOfStringSequentialType = construct(baseType.iterableOfStringType);
    
    compile = compileSequentialType;
    fromCeylon = RedHatTransformer.transformSequentialType;
    toCeylon = sequentialTypeToCeylon;
    codes = [stringSequentialType, iterableOfStringSequentialType];
}
