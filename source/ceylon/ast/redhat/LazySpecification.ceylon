import ceylon.ast.core {
    LazySpecification,
    LIdentifier,
    Parameters,
    This
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared LazySpecification lazySpecificationToCeylon(JSpecifierStatement lazySpecification) {
    "Only function or value may be specified"
    assert (is JBaseMemberExpression|JParameterizedExpression|JQualifiedMemberExpression baseMemberExpression = lazySpecification.baseMemberExpression);
    LIdentifier name;
    Parameters[] parameterLists;
    This? qualifier;
    switch (baseMemberExpression)
    case (is JBaseMemberExpression) {
        name = lIdentifierToCeylon(baseMemberExpression.identifier);
        parameterLists = [];
        qualifier = null;
    }
    case (is JParameterizedExpression) {
        "Only function may be specified with parameters"
        assert (is JBaseMemberExpression|JQualifiedMemberExpression primary = baseMemberExpression.primary);
        if (is JQualifiedMemberExpression primary) {
            "Specification may only be qualified with `this` qualifier"
            assert (primary.primary is JThis && primary.memberOperator is JMemberOp);
            qualifier = This();
        } else {
            qualifier = null;
        }
        name = lIdentifierToCeylon(primary.identifier);
        parameterLists = CeylonIterable(baseMemberExpression.parameterLists).collect(parametersToCeylon);
    }
    case (is JQualifiedMemberExpression) {
        "Specification may only be qualified with `this` qualifier"
        assert (baseMemberExpression.primary is JThis && baseMemberExpression.memberOperator is JMemberOp);
        name = lIdentifierToCeylon(baseMemberExpression.identifier);
        parameterLists = [];
        qualifier = This();
    }
    "Lazy specification must happen with lazy specifier"
    assert (is JLazySpecifierExpression specifierExpression = lazySpecification.specifierExpression);
    return LazySpecification(name, lazySpecifierToCeylon(specifierExpression), parameterLists, qualifier);
}

"Compiles the given [[code]] for a Lazy Specification
 into a [[LazySpecification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared LazySpecification? compileLazySpecification(String code) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.specifierExpression is JLazySpecifierExpression) {
        return lazySpecificationToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
