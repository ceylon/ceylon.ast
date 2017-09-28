import ceylon.ast.core {
    CaseTypes,
    MemberName,
    Node,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JCaseTypes=CaseTypes,
        JInferredTypeArguments=InferredTypeArguments,
        JStaticType=StaticType
    }
}
import org.antlr.runtime {
    Token
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts RedHat AST [[CaseTypes|JCaseTypes]] to `ceylon.ast` [[CaseTypes]]."
shared CaseTypes caseTypesToCeylon(JCaseTypes caseTypes, Anything(JNode, Node) update = noop) {
    /*
     Note: currently, the compiler doesn’t explicitly track the order of case types
     ( https://github.com/ceylon/ceylon-spec/issues/947 ).
     We work around this by using the tokens’ indexes to get the original order.
     (This trick originally comes from ceylon.formatter.)
     */
    assert (nonempty cases
                = concatenate(CeylonIterable(caseTypes.types), CeylonIterable(caseTypes.baseMemberExpressions).narrow<JBaseMemberExpression>())
                    .sort(byIncreasing(compose(Token.tokenIndex, JNode.token))));
    PrimaryType|MemberName primaryTypeOrMemberNameToCeylon(JStaticType|JBaseMemberExpression that, Anything(JNode, Node) update = noop) {
        switch (that)
        case (is JStaticType) {
            assert (is PrimaryType type = typeToCeylon(that, update));
            return type;
        }
        case (is JBaseMemberExpression) {
            "Must not have type arguments"
            assert (that.typeArguments is JInferredTypeArguments);
            return lIdentifierToCeylon(that.identifier, update);
        }
    }
    value result = CaseTypes(cases.collect(propagateUpdate(primaryTypeOrMemberNameToCeylon, update)));
    update(caseTypes, result);
    return result;
}

"Parses the given [[code]] for Case Types
 into [[CaseTypes]] using the Ceylon compiler
 (more specifically, the rule for `caseTypes`)."
shared CaseTypes? parseCaseTypes(String code, Anything(JNode, Node) update = noop) {
    if (exists jCaseTypes = createParser(code).caseTypes()) {
        return caseTypesToCeylon(jCaseTypes, update);
    } else {
        return null;
    }
}
