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
    
    // not tested directly, but used by other tests
    shared String->Block cartesianConstructorBlock = construct(
        valueDeclaration.floatXDeclaration,
        valueDeclaration.floatYDeclaration,
        valueSpecification.thisXSpecifyX,
        valueSpecification.thisYSpecifyY,
        valueSpecification.thisRSpecifySqrt,
        valueSpecification.thisPhiSpecifyAtan2
    );
    shared String->Block polarConstructorBlock = construct(
        valueDeclaration.floatRDeclaration,
        valueDeclaration.floatPhiDeclaration,
        valueSpecification.thisXSpecifyProduct,
        valueSpecification.thisYSpecifyProduct,
        valueSpecification.thisRSpecifyR,
        valueSpecification.thisPhiSpecifyPhi
    );
    shared String->Block originValueConstructorBlock = construct(
        valueSpecification.xSpecify0,
        valueSpecification.ySpecify0,
        valueSpecification.rSpecify0,
        valueSpecification.phiSpecify0
    );
    
    compile = compileBlock;
    fromCeylon = RedHatTransformer.transformBlock;
    toCeylon = blockToCeylon;
    codes = [emptyBlock, printHelloWorldBlock, printPersonNameBlock];
}
