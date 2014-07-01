import ceylon.ast.core {
    TypeArguments,
    BaseType,
    TypeName,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JStaticType=StaticType,
        JType=Type,
        JTypeArgumentList=TypeArgumentList
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import ceylon.ast.redhat {
    identifierToCeylon,
    createParser
}

"Converts a RedHat AST [[BaseType|JBaseType]] to a `ceylon.ast` [[BaseType]]."
shared BaseType baseTypeToCeylon(JBaseType baseType) {
    assert (is TypeName name = identifierToCeylon(baseType.identifier));
    TypeArguments? arguments;
    if (exists jArgs = baseType.typeArgumentList, nonempty jArguments = CeylonIterable(jArgs.types).sequence()) {
        arguments = jArguments.collect((JType jType) {
                assert (is JStaticType jType);
                return typeToCeylon(jType);
            });
    } else {
        arguments = null;
    }
    return BaseType(TypeNameWithTypeArguments(name, arguments));
}

"Compiles the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `typeNameWithArguments`)."
shared BaseType? compileBaseType(String code) {
    if (exists jTypeNameWithArguments = createParser(code).typeNameWithArguments()) {
        JBaseType baseType = JBaseType(null);
        baseType.identifier = jTypeNameWithArguments.identifier;
        baseType.typeArgumentList = jTypeNameWithArguments.typeArgumentList of JTypeArgumentList?;
        return baseTypeToCeylon(baseType);
    } else {
        return null;
    }
}
