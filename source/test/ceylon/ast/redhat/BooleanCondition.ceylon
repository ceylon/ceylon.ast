import ceylon.ast.core {
    BooleanCondition,
    Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    booleanConditionToCeylon,
    parseBooleanCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBooleanCondition=BooleanCondition
    }
}

shared object booleanCondition satisfies ConcreteTest<BooleanCondition,JBooleanCondition> {
    
    String->BooleanCondition construct(String->Expression condition)
            => "``condition.key``" -> BooleanCondition(condition.item);
    
    shared String->BooleanCondition trueCondition = construct(baseExpression.trueExpression);
    shared String->BooleanCondition aAndBCondition = construct(andOperation.aAndBExpression);
    
    parse = parseBooleanCondition;
    fromCeylon = RedHatTransformer.transformBooleanCondition;
    toCeylon = booleanConditionToCeylon;
    codes = [trueCondition, aAndBCondition];
}
