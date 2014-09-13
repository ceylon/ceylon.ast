import ceylon.ast.core {
    LIdentifier,
    LazySpecification,
    LazySpecifier,
    Parameters
}
import ceylon.ast.redhat {
    RedHatTransformer,
    lazySpecificationToCeylon,
    compileLazySpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

shared object lazySpecification satisfies ConcreteTest<LazySpecification,JSpecifierStatement> {
    
    String->LazySpecification construct(String->LIdentifier name, String->LazySpecifier specifier, <String->Parameters>* parameterLists)
            => "``name.key`` ``"".join(parameterLists*.key)`` ``specifier.key``;"->LazySpecification(name.item, specifier.item, parameterLists*.item);
    
    shared String->LazySpecification stringLazySpecification = construct(identifier.stringLIdentifier, lazySpecifier.aTimesBPlusCLazySpecifier);
    shared String->LazySpecification equalsLazySpecification = construct(identifier.equalsLIdentifier, lazySpecifier.groupedLazySpecifier, parameters.thatParameters);
    
    compile = compileLazySpecification;
    fromCeylon = RedHatTransformer.transformLazySpecification;
    toCeylon = lazySpecificationToCeylon;
    codes = [stringLazySpecification, equalsLazySpecification];
}
