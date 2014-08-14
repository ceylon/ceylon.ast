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
    shared String->VariadicType characterStarType = (baseType.characterType.key + "*")->VariadicType(baseType.characterType.item);
    
    compile = compileVariadicType;
    fromCeylon = RedHatTransformer.transformVariadicType; // TODO use shortcut refinement syntax when ceylon-compiler#1719 is fixed
    toCeylon = variadicTypeToCeylon;
    codes = [stringStarType, iterableOfStringPlusType];
}
