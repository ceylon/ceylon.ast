import ceylon.ast.core {
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSequencedType=SequencedType,
        JStaticType=StaticType
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[SequencedType|JSequencedType]] to a `ceylon.ast` [[VariadicType]]."
shared VariadicType variadicTypeToCeylon(JSequencedType sequencedType) {
    assert (is JStaticType type = sequencedType.type);
    return VariadicType(typeToCeylon(type), sequencedType.atLeastOne);
}

"Compiles the given [[code]] for a Variadic Type
 into a [[VariadicType]] using the Ceylon compiler
 (more specifically, the rule for a `variadicType`)."
shared VariadicType? compileVariadicType(String code) {
    if (is JSequencedType jVariadicType = createParser(code).variadicType()) {
        return variadicTypeToCeylon(jVariadicType);
    } else {
        return null;
    }
}
