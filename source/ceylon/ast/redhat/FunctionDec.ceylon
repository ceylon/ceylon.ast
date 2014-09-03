import ceylon.ast.core {
    DecQualifier,
    FunctionDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral
    }
}

"Converts a RedHat AST [[FunctionDec|JFunctionLiteral]] to a `ceylon.ast` [[FunctionDec]]."
shared FunctionDec functionDecToCeylon(JFunctionLiteral functionDec) {
    DecQualifier? qualifier;
    if (exists jQualifier = functionDec.type else functionDec.objectExpression) {
        qualifier = decQualifierToCeylon(jQualifier);
    } else {
        qualifier = null;
    }
    return FunctionDec(lIdentifierToCeylon(functionDec.identifier), qualifier);
}

"Compiles the given [[code]] for a Function Dec
 into a [[FunctionDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared FunctionDec? compileFunctionDec(String code) {
    if (is JFunctionLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return functionDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
