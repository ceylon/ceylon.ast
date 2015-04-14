import ceylon.ast.core {
    StringLiteral,
    StringTemplate
}
import com.redhat.ceylon.compiler.typechecker.tree {
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

"Converts a RedHat AST [[StringTemplate|JStringTemplate]] to a `ceylon.ast` [[StringTemplate]]."
shared StringTemplate stringTemplateToCeylon(JStringTemplate stringTemplate) {
    assert (nonempty literals = CeylonIterable(stringTemplate.stringLiterals).collect((JStringLiteral element) {
                value type = element.mainToken.type;
                if (type == string_start) {
                    return StringLiteral(element.text[1 : element.text.size - 3]);
                } else if (type == string_mid) {
                    return StringLiteral(element.text[2 : element.text.size - 4]);
                } else if (type == string_end) {
                    return StringLiteral(element.text[2 : element.text.size - 3]);
                } else {
                    throw AssertionError("Unexpected token type in string template");
                }
            }));
    assert (nonempty expressions = CeylonIterable(stringTemplate.expressions).collect(expressionToCeylon));
    return StringTemplate(literals, expressions);
}

"Compiles the given [[code]] for a String Template
 into a [[StringTemplate]] using the Ceylon compiler
 (more specifically, the rule for a `stringExpression`)."
shared StringTemplate? compileStringTemplate(String code) {
    if (is JStringTemplate jStringExpression = createParser(code).stringExpression()) {
        return stringTemplateToCeylon(jStringExpression);
    } else {
        return null;
    }
}
