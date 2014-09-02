import ceylon.ast.core {
    MemberDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[MemberDec]]."
shared MemberDec memberDecToCeylon(JMemberLiteral memberDec) {
    "Must be a Dec, not a Meta"
    assert (is JValueLiteral|JFunctionLiteral memberDec);
    switch (memberDec)
    case (is JValueLiteral) { return valueDecToCeylon(memberDec); }
    case (is JFunctionLiteral) { return functionDecToCeylon(memberDec); }
}

"Compiles the given [[code]] for a Member Dec
 into a [[MemberDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared MemberDec? compileMemberDec(String code) {
    if (is JValueLiteral|JFunctionLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return memberDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
