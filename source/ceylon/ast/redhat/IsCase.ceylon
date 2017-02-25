import ceylon.ast.core {
    IsCase,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIsCase=IsCase,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsCase|JIsCase]] to a `ceylon.ast` [[IsCase]]."
shared IsCase isCaseToCeylon(JIsCase isCase, Anything(JNode, Node) update = noop) {
    assert (is JStaticType jType = isCase.type);
    value result = IsCase(typeToCeylon(jType, update));
    update(isCase, result);
    return result;
}

"Parses the given [[code]] for an Is Case
 into an [[IsCase]] using the Ceylon compiler
 (more specifically, the rule for an `isCaseCondition`)."
shared IsCase? parseIsCase(String code, Anything(JNode, Node) update = noop) {
    if (exists jIsCaseCondition = createParser(code).isCaseCondition()) {
        return isCaseToCeylon(jIsCaseCondition, update);
    } else {
        return null;
    }
}
