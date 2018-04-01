import ceylon.ast.core {
    Block,
    Declaration,
    Import,
    Statement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    blockToCeylon,
    parseBlock
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JBlock=Block
    }
}

shared object block satisfies ConcreteTest<Block,JBlock> {
    
    String->Block construct(<String->Declaration|Statement>[] content, <String->Import>[] imports = [])
            => "{``"".join(concatenate(imports, content)*.key)``}" -> Block(content*.item, imports*.item);
    
    shared String->Block emptyBlock = construct([]);
    shared String->Block printHelloWorldBlock = construct([invocationStatement.printHelloWorldStatement]);
    shared String->Block printPersonNameBlock = construct([invocationStatement.printPersonNameStatement]);
    shared String->Block localImportsBlock = construct([invocationStatement.printHelloWorldStatement], [\iimport.javaLangImport]);
    
    // not tested directly, but used by other tests
    shared String->Block cartesianConstructorBlock = construct([
            valueDeclaration.floatXDeclaration,
            valueDeclaration.floatYDeclaration,
            valueSpecification.thisXSpecifyX,
            valueSpecification.thisYSpecifyY,
            valueSpecification.thisRSpecifySqrt,
            valueSpecification.thisPhiSpecifyAtan2
        ]);
    shared String->Block polarConstructorBlock = construct([
            valueDeclaration.floatRDeclaration,
            valueDeclaration.floatPhiDeclaration,
            valueSpecification.thisXSpecifyProduct,
            valueSpecification.thisYSpecifyProduct,
            valueSpecification.thisRSpecifyR,
            valueSpecification.thisPhiSpecifyPhi
        ]);
    shared String->Block originValueConstructorBlock = construct([
            valueSpecification.xSpecify0,
            valueSpecification.ySpecify0,
            valueSpecification.rSpecify0,
            valueSpecification.phiSpecify0
        ]);
    
    parse = parseBlock;
    fromCeylon = RedHatTransformer.transformBlock;
    toCeylon = blockToCeylon;
    codes = [emptyBlock, printHelloWorldBlock, printPersonNameBlock, localImportsBlock];
}
