import ceylon.ast.core {
    LIdentifier,
    LazySpecification,
    LazySpecifier,
    Parameters,
    This
}
import ceylon.ast.redhat {
    RedHatTransformer,
    lazySpecificationToCeylon,
    parseLazySpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

shared object lazySpecification satisfies ConcreteTest<LazySpecification,JSpecifierStatement> {
    
    String->LazySpecification construct(String->LIdentifier name, String->LazySpecifier specifier, <String->Parameters>[] parameterLists = [], <String->This>? qualifier = null)
            => "``(if (exists qualifier) then "``qualifier.key``." else "")`` ``name.key`` ``"".join(parameterLists*.key)`` ``specifier.key``;" -> LazySpecification(name.item, specifier.item, parameterLists*.item, qualifier?.item);
    
    shared String->LazySpecification stringLazySpecification = construct(identifier.stringLIdentifier, lazySpecifier.aTimesBPlusCLazySpecifier);
    shared String->LazySpecification equalsLazySpecification = construct(identifier.equalsLIdentifier, lazySpecifier.groupedLazySpecifier, [parameters.thatParameters]);
    shared String->LazySpecification thisEqualsLazySpecification = construct(identifier.equalsLIdentifier, lazySpecifier.groupedLazySpecifier, [parameters.thatParameters], "this" -> This());
    shared String->LazySpecification mplLazySpecification = construct(identifier.mapLIdentifier, lazySpecifier.groupedLazySpecifier, [parameters.thatParameters, parameters.emptyParameters, parameters.charactersParameters], "this" -> This());
    
    parse = parseLazySpecification;
    fromCeylon = RedHatTransformer.transformLazySpecification;
    toCeylon = lazySpecificationToCeylon;
    codes = [stringLazySpecification, equalsLazySpecification, thisEqualsLazySpecification, mplLazySpecification];
}
