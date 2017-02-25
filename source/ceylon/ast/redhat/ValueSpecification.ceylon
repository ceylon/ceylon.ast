import ceylon.ast.core {
    LIdentifier,
    Node,
    This,
    ValueSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JMemberOp=MemberOp,
        JQualifiedMemberExpression=QualifiedMemberExpression,
        JSpecifierStatement=SpecifierStatement,
        JThis=This
    }
}

"Converts a RedHat AST [[SpecifierStatement|JSpecifierStatement]] to a `ceylon.ast` [[ValueSpecification]].
 
 Only simple specification statements are converted by this method; other statements that in the RedHat AST
 are also represented via `SpecifierStatement` (e. g. `void(String s) => print(s);`) are not converted."
throws (`class AssertionError`, "If the [[valueSpecification]] isn’t a simple specification")
shared ValueSpecification valueSpecificationToCeylon(JSpecifierStatement valueSpecification, Anything(JNode, Node) update = noop) {
    "Only value may be specified"
    assert (is JBaseMemberExpression|JQualifiedMemberExpression baseMemberExpression = valueSpecification.baseMemberExpression);
    LIdentifier name;
    This? qualifier;
    switch (baseMemberExpression)
    case (is JBaseMemberExpression) {
        name = lIdentifierToCeylon(baseMemberExpression.identifier, update);
        qualifier = null;
    }
    case (is JQualifiedMemberExpression) {
        "Specification may only be qualified with `this` qualifier"
        assert (is JThis jThis = baseMemberExpression.primary, baseMemberExpression.memberOperator is JMemberOp);
        name = lIdentifierToCeylon(baseMemberExpression.identifier, update);
        qualifier = thisToCeylon(jThis, update);
    }
    value result = ValueSpecification(name, specifierToCeylon(valueSpecification.specifierExpression, update), qualifier);
    update(valueSpecification, result);
    return result;
}

"Parses the given [[code]] for a Value Specification
 into a [[ValueSpecification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared ValueSpecification? parseValueSpecification(String code, Anything(JNode, Node) update = noop) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return valueSpecificationToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
