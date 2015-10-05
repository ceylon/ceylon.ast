import ceylon.ast.core {
    Block,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBlock=Block
    },
    CustomTree {
      JGuardedVariable=GuardedVariable
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[Block|JBlock]] to a `ceylon.ast` [[Block]]."
shared Block blockToCeylon(JBlock block, Anything(JNode,Node) update = noop) {
    value result = Block(CeylonIterable(block.statements).filter((d) => !d is JGuardedVariable).collect(propagateUpdate(declarationOrStatementToCeylon, update)));
    update(block, result);
    return result;
}

"Compiles the given [[code]] for a Block
 into a [[Block]] using the Ceylon compiler
 (more specifically, the rule for a `block`)."
shared Block? compileBlock(String code, Anything(JNode,Node) update = noop) {
    if (exists jBlock = createParser(code).block()) {
        return blockToCeylon(jBlock, update);
    } else {
        return null;
    }
}
