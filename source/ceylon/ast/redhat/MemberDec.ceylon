import ceylon.ast.core {
    MemberDec,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[MemberDec]]."
shared MemberDec memberDecToCeylon(JMemberLiteral memberDec, Anything(JNode, Node) update = noop) {
    "Must be a Dec, not a Meta"
    assert (is JValueLiteral|JFunctionLiteral memberDec);
    switch (memberDec)
    case (is JValueLiteral) { return valueDecToCeylon(memberDec, update); }
    case (is JFunctionLiteral) { return functionDecToCeylon(memberDec, update); }
}

"Parses the given [[code]] for a Member Dec
 into a [[MemberDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared MemberDec? parseMemberDec(String code, Anything(JNode, Node) update = noop) {
    if (is JValueLiteral|JFunctionLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return memberDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
