import ceylon.ast.core {
    Block
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBlock=Block
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[Block|JBlock]] to a `ceylon.ast` [[Block]]."
shared Block blockToCeylon(JBlock block) {
    return Block(CeylonIterable(block.statements).collect(declarationOrStatementToCeylon));
}

"Compiles the given [[code]] for a Block
 into a [[Block]] using the Ceylon compiler
 (more specifically, the rule for a `block`)."
shared Block? compileBlock(String code) {
    if (exists jBlock = createParser(code).block()) {
        return blockToCeylon(jBlock);
    } else {
        return null;
    }
}
