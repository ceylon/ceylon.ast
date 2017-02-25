import ceylon.ast.core {
    PrimaryType,
    SatisfiedTypes
}
import ceylon.ast.redhat {
    RedHatTransformer,
    satisfiedTypesToCeylon,
    parseSatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSatisfiedTypes=SatisfiedTypes
    }
}

shared object satisfiedTypes satisfies ConcreteTest<SatisfiedTypes,JSatisfiedTypes> {
    
    String->SatisfiedTypes construct(<String->PrimaryType>+ satisfiedTypes)
            => "satisfies ``"&".join(satisfiedTypes*.key)``" -> SatisfiedTypes(satisfiedTypes*.item);
    
    shared String->SatisfiedTypes satisfiesStringStarAndPrintableSatisfiedTypes = construct(iterableType.stringStarIterableType, baseType.printableType);
    
    parse = parseSatisfiedTypes;
    fromCeylon = RedHatTransformer.transformSatisfiedTypes;
    toCeylon = satisfiedTypesToCeylon;
    codes = [satisfiesStringStarAndPrintableSatisfiedTypes];
}
