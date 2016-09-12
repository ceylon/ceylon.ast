import ceylon.ast.core {
    DecQualifier,
    Node,
    ValueDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[ValueLiteral|JValueLiteral]] to a `ceylon.ast` [[ValueDec]]."
shared ValueDec valueDecToCeylon(JValueLiteral valueDec, Anything(JNode,Node) update = noop) {
    DecQualifier qualifier;
    if (exists jQualifier = valueDec.type) {
        qualifier = decQualifierToCeylon(jQualifier, update);
    } else {
        qualifier = DecQualifier();
        update(valueDec, qualifier);
    }
    value result = ValueDec(lIdentifierToCeylon(valueDec.identifier, update), qualifier);
    update(valueDec, result);
    return result;
}

"Parses the given [[code]] for a Value Dec
 into a [[ValueDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ValueDec? parseValueDec(String code, Anything(JNode,Node) update = noop) {
    if (is JValueLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return valueDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
