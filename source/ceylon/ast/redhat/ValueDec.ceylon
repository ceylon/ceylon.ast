import ceylon.ast.core {
    DecQualifier,
    ValueDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[ValueLiteral|JValueLiteral]] to a `ceylon.ast` [[ValueDec]]."
shared ValueDec valueDecToCeylon(JValueLiteral valueDec) {
    DecQualifier? qualifier;
    if (exists jQualifier = valueDec.type else valueDec.objectExpression of Tree.BaseMemberExpression?) { // TODO remove workaround for https://github.com/ceylon/ceylon-compiler/issues/1784
        qualifier = decQualifierToCeylon(jQualifier);
    } else {
        qualifier = null;
    }
    return ValueDec(lIdentifierToCeylon(valueDec.identifier), qualifier);
}

"Compiles the given [[code]] for a Value Dec
 into a [[ValueDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ValueDec? compileValueDec(String code) {
    if (is JValueLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return valueDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
