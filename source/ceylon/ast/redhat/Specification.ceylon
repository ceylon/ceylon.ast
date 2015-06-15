import ceylon.ast.core {
    Node,
    Specification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JSpecifierStatement=SpecifierStatement
    }
}

"Converts a RedHat AST [[SpecifierStatement|JSpecifierStatement]] to a `ceylon.ast` [[Specification]]."
shared Specification specificationToCeylon(JSpecifierStatement specification, Anything(JNode,Node) update = noop) {
    if (specification.specifierExpression is JLazySpecifierExpression) {
        return lazySpecificationToCeylon(specification, update);
    } else {
        return valueSpecificationToCeylon(specification, update);
    }
}

"Compiles the given [[code]] for a Specification
 into a [[Specification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared Specification? compileSpecification(String code, Anything(JNode,Node) update = noop) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return specificationToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
