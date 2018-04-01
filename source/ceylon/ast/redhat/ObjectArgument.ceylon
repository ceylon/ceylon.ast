import ceylon.ast.core {
    ExtendedType,
    Node,
    ObjectArgument,
    SatisfiedTypes
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JObjectArgument=ObjectArgument
    }
}

"Converts a RedHat AST [[ObjectArgument|JObjectArgument]] to a `ceylon.ast` [[ObjectArgument]]."
shared ObjectArgument objectArgumentToCeylon(JObjectArgument objectArgument, Anything(JNode, Node) update = noop) {
    ExtendedType? extendedType;
    if (exists jExtendedType = objectArgument.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType, update);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = objectArgument.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes, update);
    } else {
        satisfiedTypes = null;
    }
    value result = ObjectArgument(lIdentifierToCeylon(objectArgument.identifier, update), classBodyToCeylon(objectArgument.classBody, update), extendedType, satisfiedTypes);
    update(objectArgument, result);
    return result;
}

"Parses the given [[code]] for an Object Argument
 into an [[ObjectArgument]] using the Ceylon compiler
 (more specifically, the rule for an `objectArgument`)."
shared ObjectArgument? parseObjectArgument(String code, Anything(JNode, Node) update = noop) {
    if (exists jObjectArgument = createParser(code).objectArgument()) {
        return objectArgumentToCeylon(jObjectArgument, update);
    } else {
        return null;
    }
}
