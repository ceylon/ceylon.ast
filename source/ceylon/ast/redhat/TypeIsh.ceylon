import ceylon.ast.core {
    Node,
    TypeIsh
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDefaultedType=DefaultedType,
        JSequencedType=SequencedType,
        JStaticType=StaticType,
        JType=Type
    }
}

"Converts a RedHat AST [[Type|JType]] to a `ceylon.ast` [[TypeIsh]]."
shared TypeIsh typeIshToCeylon(JType typeIsh, Anything(JNode,Node) update = noop) {
    switch (typeIsh)
    case (is JStaticType) { return typeToCeylon(typeIsh, update); }
    case (is JSequencedType) { return variadicTypeToCeylon(typeIsh, update); }
    case (is JDefaultedType) { return defaultedTypeToCeylon(typeIsh, update); }
    // TODO more cases
    else {
        throw Exception("Unknown RedHat AST type!");
    }
}

"Compiles the given [[code]] for a Type-ish
 into a [[TypeIsh]] using the Ceylon compiler
 (more specifically, the rule for a `type`, `variadicType` or `defaultedType`)."
shared TypeIsh? compileTypeIsh(String code, Anything(JNode,Node) update = noop) {
    if (exists jVariadicType = createParser(code).variadicType()) {
        assert (is JStaticType|JSequencedType jVariadicType);
        switch (jVariadicType)
        case (is JStaticType) { return typeToCeylon(jVariadicType, update); }
        case (is JSequencedType) { return variadicTypeToCeylon(jVariadicType, update); }
    } else if (exists jDefaultedType = createParser(code).defaultedType()) {
        assert (is JStaticType|JDefaultedType jDefaultedType);
        switch (jDefaultedType)
        case (is JStaticType) { return typeToCeylon(jDefaultedType, update); }
        case (is JDefaultedType) { return defaultedTypeToCeylon(jDefaultedType, update); }
    } else {
        return null;
    }
}
