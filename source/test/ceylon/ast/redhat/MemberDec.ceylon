import ceylon.ast.core {
    MemberDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberDecToCeylon,
    compileMemberDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object memberDec satisfies AbstractTest<MemberDec,JMemberLiteral> {
    compile = compileMemberDec;
    fromCeylon = RedHatTransformer.transformMemberDec;
    toCeylon = memberDecToCeylon;
    
    tests = [valueDec, functionDec];
}
