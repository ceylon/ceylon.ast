import ceylon.ast.core {
    UnioningExpression,
    SpreadArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spreadArgumentToCeylon,
    compileSpreadArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadArgument=SpreadArgument
    }
}

shared object spreadArgument satisfies ConcreteTest<SpreadArgument,JSpreadArgument> {
    
    String->SpreadArgument construct(String->UnioningExpression argument)
            => "*``argument.key``"->SpreadArgument(argument.item);
    
    shared String->SpreadArgument spreadTextArgument = construct(baseExpression.textExpression);
    
    compile = compileSpreadArgument;
    fromCeylon = RedHatTransformer.transformSpreadArgument;
    toCeylon = spreadArgumentToCeylon;
    codes = [spreadTextArgument];
}
