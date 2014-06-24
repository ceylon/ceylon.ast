import ceylon.ast.core {
    TypeIsh
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultedType=DefaultedType,
        JSequencedType=SequencedType,
        JStaticType=StaticType,
        JType=Type
    }
}

"Converts a RedHat AST [[Type|JType]] to a `ceylon.ast` [[TypeIsh]]."
shared TypeIsh typeIshToCeylon(JType typeIsh) {
    switch (typeIsh)
    case (is JStaticType) { return typeToCeylon(typeIsh); }
    case (is JSequencedType) { return variadicTypeToCeylon(typeIsh); }
    case (is JDefaultedType) { return defaultedTypeToCeylon(typeIsh); }
    // TODO more cases
    else {
        throw Exception("Unknown RedHat AST type!");
    }
}

"Compiles the given [[code]] for a Type-ish
 into a [[TypeIsh]] using the Ceylon compiler
 (more specifically, the rule for a `type`, `variadicType` or `defaultedType`)."
shared TypeIsh? compileTypeIsh(String code) {
    if (exists jVariadicType = createParser(code).variadicType()) {
        assert (is JStaticType|JSequencedType jVariadicType);
        switch (jVariadicType)
        case (is JStaticType) { return typeToCeylon(jVariadicType); }
        case (is JSequencedType) { return variadicTypeToCeylon(jVariadicType); }
    } else if (exists jDefaultedType = createParser(code).defaultedType()) {
        assert (is JStaticType|JDefaultedType jDefaultedType);
        switch (jDefaultedType)
        case (is JStaticType) { return typeToCeylon(jDefaultedType); }
        case (is JDefaultedType) { throw Error("Not implemented yet!"); } // TODO implement
    } else {
        return null;
    }
}
