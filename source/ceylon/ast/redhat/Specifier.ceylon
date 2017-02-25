import ceylon.ast.core {
    Node,
    Specifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JParExpression=ParExpression,
        JSpecifierExpression=SpecifierExpression
    }
}

"Converts a RedHat AST [[SpecifierExpression|JSpecifierExpression]] to a `ceylon.ast` [[Specifier]].
 
 Note that this only converts direct specifier expressions; lazy specifier expressions,
 which in the RedHat AST ([[LazySpecifierExpression|JLazySpecifierExpression]]) are a
 subclass of regular specifier expressions, are not converted and throw an [[AssertionError]]."
throws (`class AssertionError`, "If [[specifier]] is a [[LazySpecifierExpression|JLazySpecifierExpression]]")
shared Specifier specifierToCeylon(JSpecifierExpression specifier, Anything(JNode, Node) update = noop) {
    "Must be a “wrapper” Expression, not a grouping Expression"
    assert (!specifier.expression is JParExpression);
    "Must be a regular specifier"
    assert (!specifier is JLazySpecifierExpression);
    value result = Specifier(expressionToCeylon(specifier.expression.term, update));
    update(specifier, result);
    return result;
}

"Parses the given [[code]] for a Specifier
 into a [[Specifier]] using the Ceylon compiler
 (more specifically, the rule for a `specifier`)."
shared Specifier? parseSpecifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jSpecifier = createParser(code).specifier()) {
        return specifierToCeylon(jSpecifier, update);
    } else {
        return null;
    }
}
