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
    
    shared actual SequentialType? compile(String code) => compileSequentialType(code);
    shared actual JSequenceType fromCeylon(RedHatTransformer transformer)(SequentialType node) => transformer.transformSequentialType(node);
    shared actual SequentialType toCeylon(JSequenceType node) => sequentialTypeToCeylon(node);
    codes = [stringSequentialType, iterableOfStringSequentialType];
}
