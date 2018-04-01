import ceylon.ast.core {
    MemberDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberDecToCeylon,
    parseMemberDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object memberDec satisfies AbstractTest<MemberDec,JMemberLiteral> {
    parse = parseMemberDec;
    fromCeylon = RedHatTransformer.transformMemberDec;
    toCeylon = memberDecToCeylon;
    
    tests = [valueDec, functionDec];
}
