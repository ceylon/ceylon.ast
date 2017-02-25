import ceylon.ast.core {
    MainType,
    Node,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSequencedType=SequencedType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[SequencedType|JSequencedType]] to a `ceylon.ast` [[VariadicType]]."
shared VariadicType variadicTypeToCeylon(JSequencedType sequencedType, Anything(JNode, Node) update = noop) {
    assert (is JStaticType jType = sequencedType.type,
        is MainType type = typeToCeylon(jType, update));
    value result = VariadicType(type, sequencedType.atLeastOne);
    update(sequencedType, result);
    return result;
}

"Parses the given [[code]] for a Variadic Type
 into a [[VariadicType]] using the Ceylon compiler
 (more specifically, the rule for a `variadicType`)."
shared VariadicType? parseVariadicType(String code, Anything(JNode, Node) update = noop) {
    if (is JSequencedType jVariadicType = createParser(code).variadicType()) {
        return variadicTypeToCeylon(jVariadicType, update);
    } else {
        return null;
    }
}
