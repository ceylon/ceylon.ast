import ceylon.ast.core {
    Type,
    TypeSpecifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeSpecifierToCeylon,
    compileTypeSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeSpecifier=TypeSpecifier
    }
}

shared object typeSpecifier satisfies ConcreteTest<TypeSpecifier,JTypeSpecifier> {
    
    String->TypeSpecifier construct(String->Type type)
            => "=>``type.key``;"->TypeSpecifier(type.item);
    
    shared String->TypeSpecifier mapOfStringPeopleTypeSpecifier = construct(baseType.mapOfStringPeopleType);
    shared String->TypeSpecifier callableTypeSpecifier = construct(callableType.floatStarTupleFromStringPlusCallableType);
    
    compile = compileTypeSpecifier;
    fromCeylon = RedHatTransformer.transformTypeSpecifier;
    toCeylon = typeSpecifierToCeylon;
    codes = [mapOfStringPeopleTypeSpecifier, callableTypeSpecifier];
}
