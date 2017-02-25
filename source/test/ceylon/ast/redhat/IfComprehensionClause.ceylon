import ceylon.ast.core {
    ComprehensionClause,
    Conditions,
    IfComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ifComprehensionClauseToCeylon,
    parseIfComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfComprehensionClause=IfComprehensionClause
    }
}

shared object ifComprehensionClause satisfies ConcreteTest<IfComprehensionClause,JIfComprehensionClause> {
    
    String->IfComprehensionClause construct(String->Conditions conditions, String->ComprehensionClause clause)
            => "if ``conditions.key`` ``clause.key``" -> IfComprehensionClause(conditions.item, clause.item);
    
    shared String->IfComprehensionClause ifTrueCommaAAndBThenIComprehensionClause = construct(conditions.trueCommaAAndBConditions, expressionComprehensionClause.iExpressionComprehensionClause);
    // TODO better tests
    
    parse = parseIfComprehensionClause;
    fromCeylon = RedHatTransformer.transformIfComprehensionClause;
    toCeylon = ifComprehensionClauseToCeylon;
    codes = [ifTrueCommaAAndBThenIComprehensionClause];
}
