import ceylon.ast.core {
    Specifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLazySpecifierExpression=LazySpecifierExpression,
        JSpecifierExpression=SpecifierExpression
    }
}

"Converts a RedHat AST [[SpecifierExpression|JSpecifierExpression]] to a `ceylon.ast` [[Specifier]].
 
 Note that this only converts direct specifier expressions; lazy specifier expressions,
 which in the RedHat AST ([[LazySpecifierExpression|JLazySpecifierExpression]]) are a
 subclass of regular specifier expressions, are not converted and throw an [[AssertionError]]."
throws (`class AssertionError`, "If [[specifier]] is a [[LazySpecifierExpression|JLazySpecifierExpression]]")
shared Specifier specifierToCeylon(JSpecifierExpression specifier) {
    "Must be a “wrapper” Expression, not a grouping Expression"
    assert (!specifier.expression.mainToken exists);
    "Must be a regular specifier"
    assert (!specifier is JLazySpecifierExpression);
    return Specifier(expressionToCeylon(specifier.expression.term));
}

"Compiles the given [[code]] for a Specifier
 into a [[Specifier]] using the Ceylon compiler
 (more specifically, the rule for a `specifier`)."
shared Specifier? compileSpecifier(String code) {
    if (exists jSpecifier = createParser(code).specifier()) {
        return specifierToCeylon(jSpecifier);
    } else {
        return null;
    }
}
