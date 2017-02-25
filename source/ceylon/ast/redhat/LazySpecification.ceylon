import ceylon.ast.core {
    LazySpecification,
    LIdentifier,
    Node,
    Parameters,
    This
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JLazySpecifierExpression=LazySpecifierExpression,
        JMemberOp=MemberOp,
        JParameterizedExpression=ParameterizedExpression,
        JQualifiedMemberExpression=QualifiedMemberExpression,
        JSpecifierStatement=SpecifierStatement,
        JThis=This
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[SpecifierStatement|JSpecifierStatement]] to a `ceylon.ast` [[LazySpecification]].
 
 Only lazy specification statements are converted by this function; for non-lazy specification statements,
 use [[valueSpecificationToCeylon]]."
shared LazySpecification lazySpecificationToCeylon(JSpecifierStatement lazySpecification, Anything(JNode, Node) update = noop) {
    "Only function or value may be specified"
    assert (is JBaseMemberExpression|JParameterizedExpression|JQualifiedMemberExpression baseMemberExpression = lazySpecification.baseMemberExpression);
    LIdentifier name;
    Parameters[] parameterLists;
    This? qualifier;
    switch (baseMemberExpression)
    case (is JBaseMemberExpression) {
        name = lIdentifierToCeylon(baseMemberExpression.identifier, update);
        parameterLists = [];
        qualifier = null;
    }
    case (is JParameterizedExpression) {
        "Only function may be specified with parameters"
        assert (is JBaseMemberExpression|JQualifiedMemberExpression primary = baseMemberExpression.primary);
        if (is JQualifiedMemberExpression primary) {
            "Specification may only be qualified with `this` qualifier"
            assert (is JThis jThis = primary.primary, primary.memberOperator is JMemberOp);
            qualifier = thisToCeylon(jThis, update);
        } else {
            qualifier = null;
        }
        name = lIdentifierToCeylon(primary.identifier, update);
        parameterLists = CeylonIterable(baseMemberExpression.parameterLists).collect(propagateUpdate(parametersToCeylon, update));
    }
    case (is JQualifiedMemberExpression) {
        "Specification may only be qualified with `this` qualifier"
        assert (is JThis jThis = baseMemberExpression.primary, baseMemberExpression.memberOperator is JMemberOp);
        name = lIdentifierToCeylon(baseMemberExpression.identifier, update);
        parameterLists = [];
        qualifier = thisToCeylon(jThis, update);
    }
    "Lazy specification must happen with lazy specifier"
    assert (is JLazySpecifierExpression specifierExpression = lazySpecification.specifierExpression);
    value result = LazySpecification(name, lazySpecifierToCeylon(specifierExpression, update), parameterLists, qualifier);
    update(lazySpecification, result);
    return result;
}

"Parses the given [[code]] for a Lazy Specification
 into a [[LazySpecification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared LazySpecification? parseLazySpecification(String code, Anything(JNode, Node) update = noop) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.specifierExpression is JLazySpecifierExpression) {
        return lazySpecificationToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
