import ceylon.ast.core {
    NonemptyOperation,
    Precedence9Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    nonemptyOperationToCeylon,
    compileNonemptyOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNonempty=Nonempty
    }
}

shared object nonemptyOperation satisfies ConcreteTest<NonemptyOperation,JNonempty> {
    
    String->NonemptyOperation construct(String->Precedence9Expression child)
            => "``child.key`` nonempty"->NonemptyOperation(child.item);
    
    shared String->NonemptyOperation aIntersectBNonemptyExpression = construct(intersectionOperation.aIntersectBExpression);
    shared String->NonemptyOperation aUnionBComplementAIntersectBNonemptyExpression = construct(complementOperation.aUnionBComplementAIntersectBExpression);
    
    compile = compileNonemptyOperation;
    fromCeylon = RedHatTransformer.transformNonemptyOperation;
    toCeylon = nonemptyOperationToCeylon;
    codes = [aIntersectBNonemptyExpression, aUnionBComplementAIntersectBNonemptyExpression];
}
