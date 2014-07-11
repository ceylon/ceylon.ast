import ceylon.ast.core {
    DefaultedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultedType=DefaultedType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[DefaultedType|JDefaultedType]] to a `ceylon.ast` [[DefaultedType]]."
shared DefaultedType defaultedTypeToCeylon(JDefaultedType defaultedType) {
    assert (is JStaticType jType = defaultedType.type);
    return DefaultedType(typeToCeylon(jType));
}

"Compiles the given [[code]] for a Defaulted Type
 into a [[DefaultedType]] using the Ceylon compiler
 (more specifically, the rule for a `defaultedType`).
 
 Take care:
 
     Iterable<String>=
 
 is lexed as
 
     Iterable, <, String, >=
 
 which can’t be parsed. Use
 
     Iterable<String> =
 
 instead, if necessary."
shared DefaultedType? compileDefaultedType(String code) {
    if (is JDefaultedType jDefaultedType = createParser(code).defaultedType(), jDefaultedType.type is JStaticType) {
        return defaultedTypeToCeylon(jDefaultedType);
    } else {
        return null;
    }
}
