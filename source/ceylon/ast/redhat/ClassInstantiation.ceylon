import ceylon.ast.core {
    ClassInstantiation,
    Super,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JInvocationExpression=InvocationExpression,
        JQualifiedType=QualifiedType,
        JSimpleType=SimpleType,
        JSuperType=SuperType
    },
    CustomTree {
        JExtendedTypeExpression=ExtendedTypeExpression
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[ClassInstantiation]].
 
 This is only an internal helper function for [[extendedTypeToCeylon]],
 [[classSpecifierToCeylon]] and [[constructorDefinitionToCeylon]],
 as the RedHat AST has no direct equivalent of [[ClassInstantiation]]."
ClassInstantiation classInstantiationToCeylon(JSimpleType type, JInvocationExpression invocationExpression) {
    assert (invocationExpression.primary is JExtendedTypeExpression); // we can’t actually do anything with it, as JExtendedTypeExpression has no getExtendedType()
    TypeArguments? typeArguments;
    if (exists jTypeArguments = type.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments);
    } else {
        typeArguments = null;
    }
    value typeNameWithTypeArguments = TypeNameWithTypeArguments(uIdentifierToCeylon(type.identifier), typeArguments);
    assert (is JBaseType|JQualifiedType type);
    switch (type)
    case (is JBaseType) {
        return ClassInstantiation {
            name = typeNameWithTypeArguments;
            arguments = positionalArgumentsToCeylon(invocationExpression.positionalArgumentList);
        };
    }
    case (is JQualifiedType) {
        assert (type.outerType is JSuperType);
        return ClassInstantiation {
            name = typeNameWithTypeArguments;
            arguments = positionalArgumentsToCeylon(invocationExpression.positionalArgumentList);
            qualifier = Super();
        };
    }
}
