import ceylon.ast.core {
    Block,
    DynamicModifier,
    FunctionArgument,
    FunctionModifier,
    LazySpecifier,
    Type,
    VoidModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared FunctionArgument functionArgumentToCeylon(JMethodArgument functionArgument) {
    assert (is JStaticType|JFunctionModifier|JVoidModifier|JDynamicModifier jType = functionArgument.type);
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    switch (jType)
    case (is JStaticType) { type = typeToCeylon(jType); }
    case (is JVoidModifier) { type = voidModifierToCeylon(jType); }
    case (is JFunctionModifier) { type = functionModifierToCeylon(jType); }
    case (is JDynamicModifier) { type = dynamicModifierToCeylon(jType); }
    assert (nonempty parameterLists = CeylonIterable(functionArgument.parameterLists).collect(parametersToCeylon));
    Block|LazySpecifier definition;
    if (exists jBlock = functionArgument.block) {
        "Function argument can’t have both a block and a specifier"
        assert (!functionArgument.specifierExpression exists);
        definition = blockToCeylon(jBlock);
    } else {
        "Function argument must have either a block or a specifier"
        assert (exists jSpecifierExpression = functionArgument.specifierExpression);
        "Specifier must be lazy"
        assert (is JLazySpecifierExpression jSpecifierExpression);
        definition = lazySpecifierToCeylon(jSpecifierExpression);
    }
    return FunctionArgument(lIdentifierToCeylon(functionArgument.identifier), type, parameterLists, definition);
}

"Compiles the given [[code]] for a Function Argument
 into a [[FunctionArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared FunctionArgument? compileFunctionArgument(String code) {
    if (is JMethodArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return functionArgumentToCeylon(jNamedArgumentDeclaration);
    } else {
        return null;
    }
}
