import ceylon.ast.core {
    Specification,
    SpecifiedArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    specifiedArgumentToCeylon,
    parseSpecifiedArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNamedArgument=NamedArgument
    }
}

shared object specifiedArgument satisfies ConcreteTest<SpecifiedArgument,JNamedArgument> {
    
    String->SpecifiedArgument construct(String->Specification specification)
            => "``specification.key``" -> SpecifiedArgument(specification.item);
    
    shared String->SpecifiedArgument sizeSpecify0Argument = construct(valueSpecification.sizeSpecify0);
    shared String->SpecifiedArgument equalsArgument = construct(lazySpecification.equalsLazySpecification);
    shared String->SpecifiedArgument stringArgument = construct(lazySpecification.stringLazySpecification);
    
    parse = parseSpecifiedArgument;
    fromCeylon = RedHatTransformer.transformSpecifiedArgument;
    toCeylon = specifiedArgumentToCeylon;
    codes = [sizeSpecify0Argument, equalsArgument, stringArgument];
}
