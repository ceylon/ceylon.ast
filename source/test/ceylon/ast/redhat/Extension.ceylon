import ceylon.ast.core {
    Extension,
    PackageQualifier,
    PositionalArguments,
    Super,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    extensionToCeylon,
    compileExtension
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JSimpleType=SimpleType
    }
}

shared object extension satisfies ConcreteTest<Extension,JInvocationExpression|JSimpleType> {
    
    String->Extension construct(String->TypeNameWithTypeArguments nameAndArgs, <String->PositionalArguments>? arguments, <String->PackageQualifier|Super>? qualifier)
            => "`` qualifier?.key else "" ````nameAndArgs.key```` arguments?.key else "" ``"->Extension(nameAndArgs.item, arguments?.item, qualifier?.item);
    
    shared String->Extension objectExtension = construct("Object"->TypeNameWithTypeArguments(UIdentifier("Object")), positionalArguments.emptyPositionalArguments, null);
    shared String->Extension packageObjectExtension = construct("Object"->TypeNameWithTypeArguments(UIdentifier("Object")), positionalArguments.emptyPositionalArguments, "package."->PackageQualifier());
    shared String->Extension superInnerExtension = construct("Inner"->TypeNameWithTypeArguments(UIdentifier("Inner")), positionalArguments.emptyPositionalArguments, "super."->Super());
    shared String->Extension objectOfStringExtension = construct("Object<String>"->TypeNameWithTypeArguments(UIdentifier("Object"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, null);
    shared String->Extension packageObjectOfStringExtension = construct("Object<String>"->TypeNameWithTypeArguments(UIdentifier("Object"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, "package."->PackageQualifier());
    shared String->Extension superInnerOfStringExtension = construct("Inner<String>"->TypeNameWithTypeArguments(UIdentifier("Inner"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, "super."->Super());
    
    // not tested directly, but used by other tests
    shared String->Extension extendsAnything = construct("Anything"->TypeNameWithTypeArguments(UIdentifier("Anything")), positionalArguments.emptyPositionalArguments, null);
    shared String->Extension extendsNull = construct("Null"->TypeNameWithTypeArguments(UIdentifier("Null")), positionalArguments.emptyPositionalArguments, null);
    shared String->Extension extendsStringCharacters = construct("String"->TypeNameWithTypeArguments(UIdentifier("String")), positionalArguments.spreadTextPositionalArguments, null);
    
    compile = compileExtension;
    fromCeylon = RedHatTransformer.transformExtension;
    toCeylon = extensionToCeylon;
    codes = [objectExtension, packageObjectExtension, superInnerExtension, objectOfStringExtension, packageObjectOfStringExtension, superInnerOfStringExtension];
}
