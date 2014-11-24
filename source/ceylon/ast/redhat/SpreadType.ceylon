import ceylon.ast.core {
    SpreadType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadType=SpreadType
    }
}

"Converts a RedHat AST [[SpreadType|JSpreadType]] to a `ceylon.ast` [[SpreadType]]."
shared SpreadType spreadTypeToCeylon(JSpreadType spreadType) {
    return SpreadType(TODO);
}

"Compiles the given [[code]] for a Spread Type
 into a [[SpreadType]] using the Ceylon compiler
 (more specifically, the rule for a `spreadType`)."
shared SpreadType? compileSpreadType(String code) {
    if (exists jSpreadType = createParser(code).spreadType()) {
        return spreadTypeToCeylon(jSpreadType);
    } else {
        return null;
    }
}
