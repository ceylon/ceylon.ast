import ceylon.ast.core {
    Specification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JSpecifierStatement=SpecifierStatement
    }
}

"Converts a RedHat AST [[SpecifierStatement|JSpecifierStatement]] to a `ceylon.ast` [[Specification]]."
shared Specification specificationToCeylon(JSpecifierStatement specification) {
    if (specification.specifierExpression is JLazySpecifierExpression) {
        return lazySpecificationToCeylon(specification);
    } else {
        return valueSpecificationToCeylon(specification);
    }
}

"Compiles the given [[code]] for a Specification
 into a [[Specification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared Specification? compileSpecification(String code) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return specificationToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
