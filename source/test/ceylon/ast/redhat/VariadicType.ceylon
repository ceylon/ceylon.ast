import ceylon.ast.core {
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    variadicTypeToCeylon,
    compileVariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequencedType=SequencedType
    }
}

shared object variadicType satisfies ConcreteTest<VariadicType,JSequencedType> {
    shared String->VariadicType stringStarType = (baseType.stringType.key + "*")->VariadicType(baseType.stringType.item);
    shared String->VariadicType iterableOfStringPlusType = (baseType.iterableOfStringType.key + "+")->VariadicType(baseType.iterableOfStringType.item, true);
    
    // not tested directly, but used by other tests
    shared String->VariadicType stringPlusType = (baseType.stringType.key + "+")->VariadicType(baseType.stringType.item, true);
    shared String->VariadicType floatStarType = (baseType.floatType.key + "*")->VariadicType(baseType.floatType.item);
    
    shared actual VariadicType? compile(String code) => compileVariadicType(code);
    shared actual JSequencedType fromCeylon(RedHatTransformer transformer)(VariadicType node) => transformer.transformVariadicType(node); // TODO use shortcut refinement syntax when ceylon-compiler#1719 is fixed
    shared actual VariadicType toCeylon(JSequencedType node) => variadicTypeToCeylon(node);
    codes = [stringStarType, iterableOfStringPlusType];
}
