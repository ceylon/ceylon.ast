import ceylon.ast.core {
    TypeArguments,
    BaseType,
    TypeArgument,
    TypeNameWithTypeArguments,
    Variance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JStaticType=StaticType,
        JType=Type
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[BaseType|JBaseType]] to a `ceylon.ast` [[BaseType]]."
shared BaseType baseTypeToCeylon(JBaseType baseType) {
    TypeArguments? arguments;
    if (exists jArgs = baseType.typeArgumentList, nonempty jArguments = CeylonIterable(jArgs.types).sequence()) {
        arguments = jArguments.collect((JType jType) {
                assert (is JStaticType jType);
                value type = typeToCeylon(jType);
                Variance? variance;
                if (exists jTypeVariance = jType.typeVariance) {
                    variance = varianceToCeylon(jTypeVariance);
                } else {
                    variance = null;
                }
                return TypeArgument(type, variance);
            });
    } else {
        arguments = null;
    }
    return BaseType(TypeNameWithTypeArguments(uIdentifierToCeylon(baseType.identifier), arguments));
}

"Compiles the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `typeNameWithArguments`)."
shared BaseType? compileBaseType(String code) {
    if (exists jTypeNameWithArguments = createParser(code).typeNameWithArguments()) {
        JBaseType baseType = JBaseType(null);
        baseType.identifier = jTypeNameWithArguments.identifier;
        baseType.typeArgumentList = jTypeNameWithArguments.typeArgumentList;
        return baseTypeToCeylon(baseType);
    } else {
        return null;
    }
}
