import ceylon.ast.core {
    AnyMemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyMemberOperatorToCeylon,
    compileAnyMemberOperator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOperator=MemberOperator
    }
}

shared object anyMemberOperator satisfies AbstractTest<AnyMemberOperator,JMemberOperator> {
    compile = compileAnyMemberOperator;
    fromCeylon = RedHatTransformer.transformAnyMemberOperator;
    toCeylon = anyMemberOperatorToCeylon;
    
    tests = [memberOperator, safeMemberOperator, spreadMemberOperator];
}
