import ceylon.ast.core {
    UnioningExpression,
    SpreadArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spreadArgumentToCeylon,
    parseSpreadArgument
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadArgument=SpreadArgument
    }
}

shared object spreadArgument satisfies ConcreteTest<SpreadArgument,JSpreadArgument> {
    
    String->SpreadArgument construct(String->UnioningExpression argument)
            => "*``argument.key``" -> SpreadArgument(argument.item);
    
    shared String->SpreadArgument spreadTextArgument = construct(baseExpression.textExpression);
    
    parse = parseSpreadArgument;
    fromCeylon = RedHatTransformer.transformSpreadArgument;
    toCeylon = spreadArgumentToCeylon;
    codes = [spreadTextArgument];
}
