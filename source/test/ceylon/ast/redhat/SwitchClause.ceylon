import ceylon.ast.core {
    Expression,
    SwitchClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    switchClauseToCeylon,
    compileSwitchClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSwitchClause=SwitchClause
    }
}

shared object switchClause satisfies ConcreteTest<SwitchClause,JSwitchClause> {
    
    String->SwitchClause construct(String->Expression expression)
            => "switch (``expression.key``)"->SwitchClause(expression.item);
    
    shared String->SwitchClause switchIClause = construct(baseExpression.iExpression);
    
    compile = compileSwitchClause;
    fromCeylon = RedHatTransformer.transformSwitchClause;
    toCeylon = switchClauseToCeylon;
    codes = [switchIClause];
}
