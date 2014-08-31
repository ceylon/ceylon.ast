import ceylon.ast.core {
    IsCase
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsCase=IsCase,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsCase|JIsCase]] to a `ceylon.ast` [[IsCase]]."
shared IsCase isCaseToCeylon(JIsCase isCase) {
    assert (is JStaticType jType = isCase.type);
    return IsCase(typeToCeylon(jType));
}

"Compiles the given [[code]] for an Is Case
 into an [[IsCase]] using the Ceylon compiler
 (more specifically, the rule for an `isCaseCondition`)."
shared IsCase? compileIsCase(String code) {
    if (exists jIsCaseCondition = createParser(code).isCaseCondition()) {
        return isCaseToCeylon(jIsCaseCondition);
    } else {
        return null;
    }
}
