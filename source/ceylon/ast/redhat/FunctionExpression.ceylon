import ceylon.ast.core {
    Block,
    FunctionExpression,
    FunctionModifier,
    LazySpecifier,
    Node,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared FunctionExpression functionExpressionToCeylon(JFunctionArgument functionExpression, Anything(JNode, Node) update = noop) {
    
    assert (nonempty parameterLists = CeylonIterable(functionExpression.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
    
    LazySpecifier|Block definition;
    if (exists jExpression = functionExpression.expression) {
        "Can’t have both a specifier and a block"
        assert (!functionExpression.block exists);
        definition = LazySpecifier(expressionToCeylon(jExpression, update));
        update(jExpression, definition);
    } else {
        "Must have either a specifier or a block"
        assert (exists jBlock = functionExpression.block);
        definition = blockToCeylon(jBlock, update);
    }
    
    assert (is JFunctionModifier|JVoidModifier jType = functionExpression.type);
    FunctionModifier|VoidModifier? type;
    switch (jType)
    case (is JFunctionModifier) {
        if (jType.mainToken exists) {
            type = functionModifierToCeylon(jType, update);
        } else {
            // if the modifier is missing completely, the parser adds a fake one with no token
            type = null;
        }
    }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType, update); }
    
    value result = FunctionExpression(parameterLists, definition, type);
    update(functionExpression, result);
    return result;
}

"Parses the given [[code]] for a Function Expression
 into a [[FunctionExpression]] using the Ceylon compiler
 (more specifically, the rule for an `anonymousFunction`)."
shared FunctionExpression? parseFunctionExpression(String code, Anything(JNode, Node) update = noop) {
    if (exists jAnonymousFunction = createParser(code).anonymousFunction()) {
        return functionExpressionToCeylon(jAnonymousFunction, update);
    } else {
        return null;
    }
}
