import ceylon.ast.core {
    FunctionExpression,
    FunctionModifier,
    VoidModifier,
    Block,
    LazySpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionArgument=FunctionArgument,
        JFunctionModifier=FunctionModifier,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[FunctionArgument|JFunctionArgument]] to a `ceylon.ast` [[FunctionExpression]]."
shared FunctionExpression functionExpressionToCeylon(JFunctionArgument functionExpression) {
    
    assert (nonempty parameterLists = CeylonIterable(functionExpression.parameterLists).collect(parametersToCeylon));
    
    LazySpecifier|Block definition;
    if (exists jExpression = functionExpression.expression) {
        "Can’t have both a specifier and a block"
        assert (!functionExpression.block exists);
        definition = LazySpecifier(expressionToCeylon(jExpression));
    } else {
        "Must have either a specifier or a block"
        assert (exists jBlock = functionExpression.block);
        definition = blockToCeylon(jBlock);
    }
    
    assert (is JFunctionModifier|JVoidModifier jType = functionExpression.type);
    FunctionModifier|VoidModifier? type;
    switch (jType)
    case (is JFunctionModifier) {
        if (jType.mainToken exists) {
            type = functionModifierToCeylon(jType);
        } else {
            // if the modifier is missing completely, the parser adds a fake one with no token
            type = null;
        }
    }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    
    return FunctionExpression(parameterLists, definition, type);
}

"Compiles the given [[code]] for a Function Expression
 into a [[FunctionExpression]] using the Ceylon compiler
 (more specifically, the rule for an `anonymousFunction`)."
shared FunctionExpression? compileFunctionExpression(String code) {
    if (exists jAnonymousFunction = createParser(code).anonymousFunction()) {
        return functionExpressionToCeylon(jAnonymousFunction);
    } else {
        return null;
    }
}
