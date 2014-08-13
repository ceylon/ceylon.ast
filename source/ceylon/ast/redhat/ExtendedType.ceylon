import ceylon.ast.core {
    ExtendedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExtendedType=ExtendedType
    }
}

"Converts a RedHat AST [[ExtendedType|JExtendedType]] to a `ceylon.ast` [[ExtendedType]]."
shared ExtendedType extendedTypeToCeylon(JExtendedType extendedType) {
    return ExtendedType(classInstantiationToCeylon(extendedType.type, extendedType.invocationExpression));
}

"Compiles the given [[code]] for an Extended Type
 into an [[ExtendedType]] using the Ceylon compiler
 (more specifically, the rule for an `extendedType`)."
shared ExtendedType? compileExtendedType(String code) {
    if (exists jExtendedType = createParser(code).extendedType()) {
        return extendedTypeToCeylon(jExtendedType);
    } else {
        return null;
    }
}
