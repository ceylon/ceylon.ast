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
        string_start=\iSTRING_START,
        string_mid=\iSTRING_MID,
        string_end=\iSTRING_END
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[StringTemplate|JStringTemplate]] to a `ceylon.ast` [[StringTemplate]].
 
 Note: this function works regardless of whether the templates’ string literals still contain their quotes
 (as produced by the parser) or not (stripped by `LiteralVisitor`, for example)."
shared StringTemplate stringTemplateToCeylon(JStringTemplate stringTemplate, Anything(JNode,Node) update = noop) {
    assert (nonempty literals = CeylonIterable(stringTemplate.stringLiterals).collect((JStringLiteral element) {
                value type = element.mainToken.type;
                value text = element.text;
                StringLiteral result;
                if (text.startsWith("\"") || text.startsWith("`") ||
                    text.endsWith("\"") || text.endsWith("`")) {
                    // we need to remove quotes, let’s find out how many
                    if (type == string_start) {
                        result = StringLiteral(element.text[1 : element.text.size - 3]);
                    } else if (type == string_mid) {
                        result = StringLiteral(element.text[2 : element.text.size - 4]);
                    } else if (type == string_end) {
                        result = StringLiteral(element.text[2 : element.text.size - 3]);
                    } else {
                        throw AssertionError("Unexpected token type in string template");
                    }
                } else {
                    // someone, e. g. LiteralVisitor, already removed the quotes
                    result = StringLiteral(text);
                }
                update(element, result);
                return result;
            }));
    assert (nonempty expressions = CeylonIterable(stringTemplate.expressions).collect(propagateUpdate(expressionToCeylon, update)));
    value result = StringTemplate(literals, expressions);
    update(stringTemplate, result);
    return result;
}

"Compiles the given [[code]] for a String Template
 into a [[StringTemplate]] using the Ceylon compiler
 (more specifically, the rule for a `stringExpression`)."
shared StringTemplate? compileStringTemplate(String code, Anything(JNode,Node) update = noop) {
    if (is JStringTemplate jStringExpression = createParser(code).stringExpression()) {
        return stringTemplateToCeylon(jStringExpression, update);
    } else {
        return null;
    }
}
