import ceylon.ast.core {
    SpreadMemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spreadMemberOperatorToCeylon,
    parseSpreadMemberOperator
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadOp=SpreadOp
    }
}

shared object spreadMemberOperator satisfies ConcreteTest<SpreadMemberOperator,JSpreadOp> {
    
    shared String->SpreadMemberOperator spreadMemberOperator = "*." -> SpreadMemberOperator();
    
    parse = parseSpreadMemberOperator;
    fromCeylon = RedHatTransformer.transformSpreadMemberOperator;
    toCeylon = spreadMemberOperatorToCeylon;
    codes = [spreadMemberOperator];
}
