import ceylon.ast.core {
    Node,
    TypeAliasDefinition,
    TypeConstraint,
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeAliasDeclaration=TypeAliasDeclaration
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TypeAliasDeclaration|JTypeAliasDeclaration]] to a `ceylon.ast` [[TypeAliasDefinition]]."
shared TypeAliasDefinition typeAliasDefinitionToCeylon(JTypeAliasDeclaration typeAliasDefinition, Anything(JNode,Node) update = noop) {
    TypeParameters? typeParameters;
    if (exists jTypeParameterList = typeAliasDefinition.typeParameterList) {
        typeParameters = typeParametersToCeylon(jTypeParameterList, update);
    } else {
        typeParameters = null;
    }
    TypeConstraint[] typeConstraints;
    if (exists jTypeConstraintList = typeAliasDefinition.typeConstraintList) {
        typeConstraints = CeylonIterable(jTypeConstraintList.typeConstraints).collect(propagateUpdate(typeConstraintToCeylon, update));
    } else {
        typeConstraints = [];
    }
    value result = TypeAliasDefinition {
        name = uIdentifierToCeylon(typeAliasDefinition.identifier, update);
        specifier = typeSpecifierToCeylon(typeAliasDefinition.typeSpecifier, update);
        typeParameters = typeParameters;
        typeConstraints = typeConstraints;
        annotations = annotationsToCeylon(typeAliasDefinition.annotationList, update);
    };
    update(typeAliasDefinition, result);
    return result;
}

"Parses the given [[code]] for a Type Alias Definition
 into a [[TypeAliasDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared TypeAliasDefinition? parseTypeAliasDefinition(String code, Anything(JNode,Node) update = noop) {
    if (is JTypeAliasDeclaration jTypeAliasDefinition = createParser(code).declaration()) {
        return typeAliasDefinitionToCeylon(jTypeAliasDefinition, update);
    } else {
        return null;
    }
}
