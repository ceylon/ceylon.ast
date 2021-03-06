import ceylon.ast.core {
    ArgumentList,
    NamedArgument,
    NamedArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    namedArgumentsToCeylon,
    parseNamedArguments
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JNamedArgumentList=NamedArgumentList
    }
}

shared object namedArguments satisfies ConcreteTest<NamedArguments,JNamedArgumentList> {
    
    String->NamedArguments construct(<String->NamedArgument>[] namedArguments, String->ArgumentList iterableArgument)
            => "{``"".join(namedArguments.collect(Entry<String,NamedArgument>.key))````iterableArgument.key``}" -> NamedArguments(namedArguments*.item, iterableArgument.item);
    
    shared String->NamedArguments emptyNamedArguments = construct([], argumentList.emptyArgumentList);
    shared String->NamedArguments abcabcNamedArguments = construct([anonymousArgument.aTimesBPlusCAnonymousArgument], argumentList.abcArgumentList);
    shared String->NamedArguments sizeSpecify0NamedArguments = construct([specifiedArgument.sizeSpecify0Argument], argumentList.emptyArgumentList);
    
    parse = parseNamedArguments;
    fromCeylon = RedHatTransformer.transformNamedArguments;
    toCeylon = namedArgumentsToCeylon;
    codes = [emptyNamedArguments, abcabcNamedArguments, sizeSpecify0NamedArguments];
}
