import ceylon.ast.core {
    DynamicBlock
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicClause=DynamicClause,
        JDynamicStatement=DynamicStatement
    }
}

"Converts a RedHat AST [[DynamicStatement|JDynamicStatement]] to a `ceylon.ast` [[DynamicBlock]]."
shared DynamicBlock dynamicBlockToCeylon(JDynamicStatement dynamicBlock) {
    return DynamicBlock(blockToCeylon(dynamicBlock.dynamicClause.block));
}

"Converts a RedHat AST [[DynamicClause|JDynamicClause]] to a `ceylon.ast` [[DynamicBlock]].
 
 This function is only offered for convenience, if you happen to have
 an unwrapped `DynamicClause`; the real RedHat AST node corresponding
 to `ceylon.ast`’s [[DynamicBlock]] is [[DynamicStatement|JDynamicStatement]]."
see (`function dynamicBlockToCeylon`)
shared DynamicBlock dynamicClauseToCeylon(JDynamicClause dynamicClause) {
    return DynamicBlock(blockToCeylon(dynamicClause.block));
}

"Compiles the given [[code]] for a Dynamic Block
 into a [[DynamicBlock]] using the Ceylon compiler
 (more specifically, the rule for a `dynamicBlock`)."
shared DynamicBlock? compileDynamicBlock(String code) {
    if (exists jDynamic = createParser(code).\idynamic()) {
        return dynamicBlockToCeylon(jDynamic);
    } else {
        return null;
    }
}
