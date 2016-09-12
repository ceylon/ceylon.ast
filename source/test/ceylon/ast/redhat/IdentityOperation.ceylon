import ceylon.ast.core {
    IdentityOperation,
    ExponentiatingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    identityOperationToCeylon,
    parseIdentityOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPositiveOp=PositiveOp
    }
}

shared object identityOperation satisfies ConcreteTest<IdentityOperation,JPositiveOp> {
    
    String->IdentityOperation construct(String->ExponentiatingExpression operand)
            => "+``operand.key``"->IdentityOperation(operand.item);
    
    shared String->IdentityOperation plus1138Expression = construct(integerLiteral._1138IntegerLiteral);
    
    parse = parseIdentityOperation;
    fromCeylon = RedHatTransformer.transformIdentityOperation;
    toCeylon = identityOperationToCeylon;
    codes = [plus1138Expression];
}
