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
        TypeNameWithTypeArguments|Super qualifier;
        switch (ot = type.outerType)
        case (is JBaseType) {
            TypeArguments? outerTypeArguments;
            if (exists jTypeArguments = type.typeArgumentList) {
                outerTypeArguments = typeArgumentsToCeylon(jTypeArguments);
            } else {
                outerTypeArguments = null;
            }
            qualifier = TypeNameWithTypeArguments(uIdentifierToCeylon(ot.identifier), outerTypeArguments);
        }
        case (is JSuperType) { qualifier = Super(); }
        else { throw AssertionError("Unknown qualifier for class instantiation"); }
        return ClassInstantiation {
            name = typeNameWithTypeArguments;
            arguments = positionalArgumentsToCeylon(invocationExpression.positionalArgumentList);
            qualifier = qualifier;
        };
    }
}
