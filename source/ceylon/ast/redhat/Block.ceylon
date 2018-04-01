import ceylon.ast.core {
    Block,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBlock=Block,
        JImport=Import
    },
    CustomTree {
        JGuardedVariable=GuardedVariable
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import java.util {
    JLinkedList=LinkedList
}

"Converts a RedHat AST [[Block|JBlock]] to a `ceylon.ast` [[Block]]."
shared Block blockToCeylon(JBlock block, Anything(JNode, Node) update = noop) {
    value result = Block {
        content = CeylonIterable(block.statements).filter((d) => !d is JGuardedVariable).collect(propagateUpdate(declarationOrStatementToCeylon, update));
        imports = CeylonIterable(block.importList?.imports else JLinkedList<JImport>()).collect(propagateUpdate(importToCeylon, update));
    };
    update(block, result);
    return result;
}

"Parses the given [[code]] for a Block
 into a [[Block]] using the Ceylon compiler
 (more specifically, the rule for a `block`)."
shared Block? parseBlock(String code, Anything(JNode, Node) update = noop) {
    if (exists jBlock = createParser(code).block()) {
        return blockToCeylon(jBlock, update);
    } else {
        return null;
    }
}
