import ceylon.ast.api {
    TypeArguments,
    TypeNameWithArguments,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIdentifier=Identifier,
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

"Converts a RedHat AST [[Identifier|JIdentifier]] and [[TypeArgumentList|JTypeArgumentList]] to a `ceylon.ast` [[TypeNameWithArguments]]."
shared TypeNameWithArguments typeNameWithArgumentsToCeylon([JIdentifier, JTypeArgumentList?] typeArguments) {
    assert (is UIdentifier name = identifierToCeylon(typeArguments[0]));
    TypeArguments? arguments;
    if (exists jArgs = typeArguments[1], nonempty jArguments = CeylonIterable(jArgs.types).sequence()) {
        arguments = jArguments.collect(typeToCeylon);
    } else {
        arguments = null;
    }
    return TypeNameWithArguments(name, arguments);
}

"Compiles the given [[code]] for a Type Name with Arguments
 into a [[TypeNameWithArguments]] using the Ceylon compiler
 (more specifically, the rule for a `typeNameWithArguments`)."
shared TypeNameWithArguments? compileTypeNameWithArguments(String code) {
    if (exists jTypeNameWithArguments = createParser(code).typeNameWithArguments()) {
        return typeNameWithArgumentsToCeylon([jTypeNameWithArguments.identifier, jTypeNameWithArguments.typeArgumentList]);
    } else {
        return null;
    }
}
