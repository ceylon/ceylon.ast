import ceylon.ast.api {
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JType=Type
    }
}

"Converts a RedHat AST [[Type|JType]] to a `ceylon.ast` [[Type]]."
shared Type typeToCeylon(JType type) {
    switch (type)
    case (is JBaseType) {
        return baseTypeToCeylon(type);
    }
    else {
        throw Error("Not yet implemented!"); // TODO
    }
}

"Compiles the given [[code]] for a Type
 into a [[Type]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared Type? compileType(String code) {
    if (exists jType = createParser(code).type()) {
        return typeToCeylon(jType);
    } else {
        return null;
    }
}
