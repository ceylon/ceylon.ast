import ceylon.ast.core {
    ExtendedType,
    ObjectArgument,
    SatisfiedTypes
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectArgument=ObjectArgument
    }
}

"Converts a RedHat AST [[ObjectArgument|JObjectArgument]] to a `ceylon.ast` [[ObjectArgument]]."
shared ObjectArgument objectArgumentToCeylon(JObjectArgument objectArgument) {
    ExtendedType? extendedType;
    if (exists jExtendedType = objectArgument.extendedType) {
        extendedType = extendedTypeToCeylon(jExtendedType);
    } else {
        extendedType = null;
    }
    SatisfiedTypes? satisfiedTypes;
    if (exists jSatisfiedTypes = objectArgument.satisfiedTypes) {
        satisfiedTypes = satisfiedTypesToCeylon(jSatisfiedTypes);
    } else {
        satisfiedTypes = null;
    }
    return ObjectArgument(lIdentifierToCeylon(objectArgument.identifier), classBodyToCeylon(objectArgument.classBody), extendedType, satisfiedTypes);
}

"Compiles the given [[code]] for an Object Argument
 into an [[ObjectArgument]] using the Ceylon compiler
 (more specifically, the rule for an `objectArgument`)."
shared ObjectArgument? compileObjectArgument(String code) {
    if (exists jObjectArgument = createParser(code).objectArgument()) {
        return objectArgumentToCeylon(jObjectArgument);
    } else {
        return null;
    }
}
