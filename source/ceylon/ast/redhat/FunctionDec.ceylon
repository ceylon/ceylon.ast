import ceylon.ast.core {
    DecQualifier,
    FunctionDec,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionLiteral=FunctionLiteral
    }
}

"Converts a RedHat AST [[FunctionDec|JFunctionLiteral]] to a `ceylon.ast` [[FunctionDec]]."
shared FunctionDec functionDecToCeylon(JFunctionLiteral functionDec, Anything(JNode, Node) update = noop) {
    DecQualifier qualifier;
    if (exists jQualifier = functionDec.type) {
        qualifier = decQualifierToCeylon(jQualifier, update);
    } else {
        qualifier = DecQualifier();
        update(functionDec, qualifier);
    }
    value result = FunctionDec(lIdentifierToCeylon(functionDec.identifier, update), qualifier);
    update(functionDec, result);
    return result;
}

"Parses the given [[code]] for a Function Dec
 into a [[FunctionDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared FunctionDec? parseFunctionDec(String code, Anything(JNode, Node) update = noop) {
    if (is JFunctionLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return functionDecToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
