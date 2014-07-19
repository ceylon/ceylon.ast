import ceylon.ast.core {
    BaseExpression,
    MemberNameWithTypeArguments,
    ValueSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

"Converts a RedHat AST [[SpecifierStatement|JSpecifierStatement]] to a `ceylon.ast` [[ValueSpecification]].
 
 Only simple specification statements are converted by this method; other statements that in the RedHat AST
 are also represented via `SpecifierStatement` (e. g. `void(String s) => print(s);`) are not converted."
throws (`class AssertionError`, "If the [[valueSpecification]] isn’t a simple specification")
shared ValueSpecification valueSpecificationToCeylon(JSpecifierStatement valueSpecification) {
    assert (is BaseExpression base = expressionToCeylon(valueSpecification.baseMemberExpression),
        is MemberNameWithTypeArguments mnta = base.nameAndArgs);
    return ValueSpecification(mnta.name, specifierToCeylon(valueSpecification.specifierExpression));
}

"Compiles the given [[code]] for a Value Specification
 into a [[ValueSpecification]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared ValueSpecification? compileValueSpecification(String code) {
    if (is JSpecifierStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement()) {
        return valueSpecificationToCeylon(jExpressionOrSpecificationStatement);
    } else {
        return null;
    }
}
