import ceylon.ast.core {
    MemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberOperatorToCeylon,
    parseMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOp=MemberOp
    }
}

shared object memberOperator satisfies ConcreteTest<MemberOperator,JMemberOp> {
    
    shared String->MemberOperator memberOperator = "." -> MemberOperator();
    
    parse = parseMemberOperator;
    fromCeylon = RedHatTransformer.transformMemberOperator;
    toCeylon = memberOperatorToCeylon;
    codes = [memberOperator];
}
