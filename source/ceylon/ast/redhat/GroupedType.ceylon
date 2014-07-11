import ceylon.ast.core {
    GroupedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JGroupedType=GroupedType
    }
}

"Converts a RedHat AST [[GroupedType|JGroupedType]] to a `ceylon.ast` [[GroupedType]]."
shared GroupedType groupedTypeToCeylon(JGroupedType groupedType) {
    return GroupedType(typeToCeylon(groupedType.type));
}

"Compiles the given [[code]] for a Grouped Type
 into a [[GroupedType]] using the Ceylon compiler
 (more specifically, the rule for a `groupedType`)."
shared GroupedType? compileGroupedType(String code) {
    if (exists jGroupedType = createParser(code).groupedType()) {
        return groupedTypeToCeylon(jGroupedType);
    } else {
        return null;
    }
}
