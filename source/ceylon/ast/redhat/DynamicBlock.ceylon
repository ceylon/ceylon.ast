import ceylon.ast.core {
    DynamicBlock,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDynamicClause=DynamicClause,
        JDynamicStatement=DynamicStatement
    }
}

"Converts a RedHat AST [[DynamicStatement|JDynamicStatement]] to a `ceylon.ast` [[DynamicBlock]]."
shared DynamicBlock dynamicBlockToCeylon(JDynamicStatement dynamicBlock, Anything(JNode,Node) update = noop) {
    value result = DynamicBlock(blockToCeylon(dynamicBlock.dynamicClause.block, update));
    update(dynamicBlock, result);
    return result;
}

"Converts a RedHat AST [[DynamicClause|JDynamicClause]] to a `ceylon.ast` [[DynamicBlock]].
 
 This function is only offered for convenience, if you happen to have
 an unwrapped `DynamicClause`; the real RedHat AST node corresponding
 to `ceylon.ast`’s [[DynamicBlock]] is [[DynamicStatement|JDynamicStatement]]."
see (`function dynamicBlockToCeylon`)
shared DynamicBlock dynamicClauseToCeylon(JDynamicClause dynamicClause, Anything(JNode,Node) update = noop) {
    value result = DynamicBlock(blockToCeylon(dynamicClause.block, update));
    update(dynamicClause, result);
    return result;
}

"Parses the given [[code]] for a Dynamic Block
 into a [[DynamicBlock]] using the Ceylon compiler
 (more specifically, the rule for a `dynamicBlock`)."
shared DynamicBlock? parseDynamicBlock(String code, Anything(JNode,Node) update = noop) {
    if (exists jDynamic = createParser(code).\idynamic()) {
        return dynamicBlockToCeylon(jDynamic, update);
    } else {
        return null;
    }
}
