import ceylon.ast.core {
    SpreadType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadType=SpreadType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[SpreadType|JSpreadType]] to a `ceylon.ast` [[SpreadType]]."
shared SpreadType spreadTypeToCeylon(JSpreadType spreadType) {
    "Must be an actual type"
    assert (is JStaticType jType = spreadType.type);
    return SpreadType(typeToCeylon(jType));
}

"Compiles the given [[code]] for a Spread Type
 into a [[SpreadType]] using the Ceylon compiler
 (more specifically, the rule for a `spreadType`)."
shared SpreadType? compileSpreadType(String code) {
    if (exists jSpreadType = createParser(code).spreadType()) {
        assert (is JSpreadType jSpreadType);
        return spreadTypeToCeylon(jSpreadType);
    } else {
        return null;
    }
}
