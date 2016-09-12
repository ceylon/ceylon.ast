import ceylon.ast.core {
    Block,
    DynamicModifier,
    FunctionArgument,
    FunctionModifier,
    LazySpecifier,
    Node,
    Type,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicModifier=DynamicModifier,
        JFunctionModifier=FunctionModifier,
        JLazySpecifierExpression=LazySpecifierExpression,
        JMethodArgument=MethodArgument,
        JStaticType=StaticType,
        JVoidModifier=VoidModifier
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[MethodArgument|JMethodArgument]] to a `ceylon.ast` [[FunctionArgument]].
 
 (Warning: The RedHat `MethodArgument` should not be confused with
 [[FunctionArgument|com.redhat.ceylon.compiler.typechecker.tree::Tree.FunctionArgument]],
 which corresponds to `ceylon.ast`’s [[ceylon.ast.core::FunctionExpression]].)"
shared FunctionArgument functionArgumentToCeylon(JMethodArgument functionArgument, Anything(JNode,Node) update = noop) {
    assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionArgument.type);
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType, update); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType, update); }
    case (is JFunctionModifier) { type = functionModifierToCeylon(jType, update); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType, update); }
    assert (nonempty parameterLists = CeylonIterable(functionArgument.parameterLists).collect(propagateUpdate(parametersToCeylon, update)));
    Block|LazySpecifier definition;
    if (exists jBlock = functionArgument.block) {
        "Function argument can’t have both a block and a specifier"
        assert (!functionArgument.specifierExpression exists);
        definition = blockToCeylon(jBlock, update);
    } else {
        "Function argument must have either a block or a specifier"
        assert (exists jSpecifierExpression = functionArgument.specifierExpression);
        "Specifier must be lazy"
        assert (is JLazySpecifierExpression jSpecifierExpression);
        definition = lazySpecifierToCeylon(jSpecifierExpression, update);
    }
    value result = FunctionArgument(lIdentifierToCeylon(functionArgument.identifier, update), type, parameterLists, definition);
    update(functionArgument, result);
    return result;
}

"Parses the given [[code]] for a Function Argument
 into a [[FunctionArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared FunctionArgument? parseFunctionArgument(String code, Anything(JNode,Node) update = noop) {
    if (is JMethodArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return functionArgumentToCeylon(jNamedArgumentDeclaration, update);
    } else {
        return null;
    }
}
