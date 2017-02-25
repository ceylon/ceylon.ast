import ceylon.ast.core {
    Expression,
    LIdentifier,
    SpecifiedVariable,
    Specifier,
    SwitchClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    switchClauseToCeylon,
    parseSwitchClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchClause=SwitchClause
    }
}

shared object switchClause satisfies ConcreteTest<SwitchClause,JSwitchClause> {
    
    String->SwitchClause construct(String->Expression|SpecifiedVariable expression)
            => "switch (``expression.key``)" -> SwitchClause(expression.item);
    
    shared String->SwitchClause switchIClause = construct(baseExpression.iExpression);
    shared String->SwitchClause switchVarIClause = construct("var = i" -> SpecifiedVariable {
            name = LIdentifier("var");
            specifier = Specifier(baseExpression.iExpression.item);
        });
    
    parse = parseSwitchClause;
    fromCeylon = RedHatTransformer.transformSwitchClause;
    toCeylon = switchClauseToCeylon;
    codes = [switchIClause, switchVarIClause];
}
