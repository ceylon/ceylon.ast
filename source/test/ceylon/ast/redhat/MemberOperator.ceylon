import ceylon.ast.core {
    MemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberOperatorToCeylon,
    compileMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOp=MemberOp
    }
}

shared object memberOperator satisfies ConcreteTest<MemberOperator,JMemberOp> {
    
    shared String->MemberOperator memberOperator = "."->MemberOperator();
    
    compile = compileMemberOperator;
    fromCeylon = RedHatTransformer.transformMemberOperator;
    toCeylon = memberOperatorToCeylon;
    codes = [memberOperator];
}
