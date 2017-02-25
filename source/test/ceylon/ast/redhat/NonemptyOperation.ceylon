import ceylon.ast.core {
    NonemptyOperation,
    SpanningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    nonemptyOperationToCeylon,
    parseNonemptyOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonempty=Nonempty
    }
}

shared object nonemptyOperation satisfies ConcreteTest<NonemptyOperation,JNonempty> {
    
    String->NonemptyOperation construct(String->SpanningExpression operand)
            => "``operand.key`` nonempty" -> NonemptyOperation(operand.item);
    
    shared String->NonemptyOperation aIntersectBNonemptyExpression = construct(intersectionOperation.aIntersectBExpression);
    shared String->NonemptyOperation aUnionBComplementAIntersectBNonemptyExpression = construct(complementOperation.aUnionBComplementAIntersectBExpression);
    
    parse = parseNonemptyOperation;
    fromCeylon = RedHatTransformer.transformNonemptyOperation;
    toCeylon = nonemptyOperationToCeylon;
    codes = [aIntersectBNonemptyExpression, aUnionBComplementAIntersectBNonemptyExpression];
}
