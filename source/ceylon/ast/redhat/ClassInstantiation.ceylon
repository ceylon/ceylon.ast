import ceylon.ast.core {
    ClassInstantiation,
    Node,
    Super,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
ClassInstantiation classInstantiationToCeylon(JSimpleType type, JInvocationExpression invocationExpression, Anything(JNode,Node) update) {
    assert (invocationExpression.primary is JExtendedTypeExpression); // we can’t actually do anything with it, as JExtendedTypeExpression has no getExtendedType()
    TypeArguments? typeArguments;
    if (exists jTypeArguments = type.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments, update);
    } else {
        typeArguments = null;
    }
    value typeNameWithTypeArguments = TypeNameWithTypeArguments(uIdentifierToCeylon(type.identifier, update), typeArguments);
    update(type, typeNameWithTypeArguments);
    assert (is JBaseType|JQualifiedType type);
    ClassInstantiation result;
    switch (type)
    case (is JBaseType) {
        result = ClassInstantiation {
            name = typeNameWithTypeArguments;
            arguments = positionalArgumentsToCeylon(invocationExpression.positionalArgumentList, update);
        };
    }
    case (is JQualifiedType) {
        TypeNameWithTypeArguments|Super qualifier;
        switch (ot = type.outerType)
        case (is JBaseType) {
            TypeArguments? outerTypeArguments;
            if (exists jTypeArguments = type.typeArgumentList) {
                outerTypeArguments = typeArgumentsToCeylon(jTypeArguments, update);
            } else {
                outerTypeArguments = null;
            }
            qualifier = TypeNameWithTypeArguments(uIdentifierToCeylon(ot.identifier, update), outerTypeArguments);
        }
        case (is JSuperType) { qualifier = Super(); }
        else { throw AssertionError("Unknown qualifier for class instantiation"); }
        update(type.outerType, qualifier);
        result = ClassInstantiation {
            name = typeNameWithTypeArguments;
            arguments = positionalArgumentsToCeylon(invocationExpression.positionalArgumentList, update);
            qualifier = qualifier;
        };
    }
    update(type, result);
    update(invocationExpression, result);
    return result;
}
