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
    
    String->Block construct(<String->Declaration|Statement>* content)
            => "{``"".join(content*.key)``}"->Block(content*.item);
    
    shared String->Block emptyBlock = construct();
    shared String->Block printHelloWorldBlock = construct(invocationStatement.printHelloWorldStatement);
    shared String->Block printPersonNameBlock = construct(invocationStatement.printPersonNameStatement);
    
    compile = compileBlock;
    fromCeylon = RedHatTransformer.transformBlock;
    toCeylon = blockToCeylon;
    codes = [emptyBlock, printHelloWorldBlock, printPersonNameBlock];
}
