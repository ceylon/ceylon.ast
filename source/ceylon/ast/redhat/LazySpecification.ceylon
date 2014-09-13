import ceylon.ast.core {
    LazySpecification,
    LIdentifier,
    Parameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JLazySpecifierExpression=LazySpecifierExpression,
        JParameterizedExpression=ParameterizedExpression,
        JSpecifierStatement=SpecifierStatement
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
    assert (is JBaseMemberExpression|JParameterizedExpression baseMemberExpression = lazySpecification.baseMemberExpression);
    LIdentifier name;
    Parameters[] parameterLists;
    switch (baseMemberExpression)
    case (is JBaseMemberExpression) {
        name = lIdentifierToCeylon(baseMemberExpression.identifier);
        parameterLists = [];
    }
    case (is JParameterizedExpression) {
        "Only function may be specified with parameters"
        assert (is JBaseMemberExpression primary = baseMemberExpression.primary);
        name = lIdentifierToCeylon(primary.identifier);
        parameterLists = CeylonIterable(baseMemberExpression.parameterLists).collect(parametersToCeylon);
    }
    "Lazy specification must happen with lazy specifier"
    assert (is JLazySpecifierExpression specifierExpression = lazySpecification.specifierExpression);
    return LazySpecification(name, lazySpecifierToCeylon(specifierExpression), parameterLists);
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
