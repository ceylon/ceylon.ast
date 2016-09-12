import ceylon.ast.core {
    Node,
    StringLiteral,
    StringTemplate
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JStringLiteral=StringLiteral,
        JStringTemplate=StringTemplate
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        verbatim_string=\iVERBATIM_STRING
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[StringTemplate|JStringTemplate]] to a `ceylon.ast` [[StringTemplate]].
 
 Note: this function works regardless of whether the templates’ string literals still contain their quotes
 (as produced by the parser) or not (stripped by `LiteralVisitor`, for example)."
shared StringTemplate stringTemplateToCeylon(JStringTemplate stringTemplate, Anything(JNode,Node) update = noop) {
    value column = let (token = stringTemplate.stringLiterals.get(0).mainToken)
            token.charPositionInLine + (token.type == verbatim_string then 3 else 1);
    assert (nonempty literals = CeylonIterable(stringTemplate.stringLiterals).collect((JStringLiteral element) {
                value result = StringLiteral(stripStringLiteral(element, column));
                update(element, result);
                return result;
            }));
    assert (nonempty expressions = CeylonIterable(stringTemplate.expressions).collect(propagateUpdate(expressionToCeylon, update)));
    value result = StringTemplate(literals, expressions);
    update(stringTemplate, result);
    return result;
}

"Parses the given [[code]] for a String Template
 into a [[StringTemplate]] using the Ceylon compiler
 (more specifically, the rule for a `stringExpression`)."
shared StringTemplate? parseStringTemplate(String code, Anything(JNode,Node) update = noop) {
    if (is JStringTemplate jStringExpression = createParser(code).stringExpression()) {
        return stringTemplateToCeylon(jStringExpression, update);
    } else {
        return null;
    }
}
