import ceylon.ast.core {
    Block,
    Declaration,
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    blockToCeylon,
    compileBlock
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBlock=Block
    }
}

shared object block satisfies ConcreteTest<Block,JBlock> {
    
    String->Block construct(<String->Declaration|Statement>[] content)
            => "{``"".join(content*.key)``}"->Block(content*.item);
    
    shared String->Block emptyBlock = construct([]);
    // TODO add a real test as soon as we have some more statements + declarations!
    
    compile = compileBlock;
    fromCeylon = RedHatTransformer.transformBlock;
    toCeylon = blockToCeylon;
    codes = [emptyBlock];
}
