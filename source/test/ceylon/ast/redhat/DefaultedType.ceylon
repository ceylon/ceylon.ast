import ceylon.ast.core {
    DefaultedType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedTypeToCeylon,
    parseDefaultedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultedType=DefaultedType
    }
}

shared object defaultedType satisfies ConcreteTest<DefaultedType,JDefaultedType> {
    shared String->DefaultedType stringDefaultedType = (baseType.stringType.key + "=") -> DefaultedType(baseType.stringType.item);
    shared String->DefaultedType iterableOfStringDefaultedType = (baseType.iterableOfStringType.key + " =") -> DefaultedType(baseType.iterableOfStringType.item);
    //                                                                                                 ^ space necessary because <Thing>= is parsed as < Thing >=, not < Thing > =
    
    // not tested directly, but used by other tests
    shared String->DefaultedType floatDefaultedType = (baseType.floatType.key + "=") -> DefaultedType(baseType.floatType.item);
    
    parse = parseDefaultedType;
    fromCeylon = RedHatTransformer.transformDefaultedType;
    toCeylon = defaultedTypeToCeylon;
    codes = [stringDefaultedType, iterableOfStringDefaultedType];
}
