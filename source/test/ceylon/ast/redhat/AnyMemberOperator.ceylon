import ceylon.ast.core {
    AnyMemberOperator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyMemberOperatorToCeylon,
    parseAnyMemberOperator
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberOperator=MemberOperator
    }
}

shared object anyMemberOperator satisfies AbstractTest<AnyMemberOperator,JMemberOperator> {
    parse = parseAnyMemberOperator;
    fromCeylon = RedHatTransformer.transformAnyMemberOperator;
    toCeylon = anyMemberOperatorToCeylon;
    
    tests = [memberOperator, safeMemberOperator, spreadMemberOperator];
}
