import ceylon.ast.core {
    Block,
    DynamicBlock
}
import ceylon.ast.redhat {
    RedHatTransformer,
    dynamicBlockToCeylon,
    parseDynamicBlock
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamicStatement=DynamicStatement
    }
}

shared object dynamicBlock satisfies ConcreteTest<DynamicBlock,JDynamicStatement> {
    
    String->DynamicBlock construct(String->Block block)
            => "dynamic ``block.key``" -> DynamicBlock(block.item);
    
    shared String->DynamicBlock printPersonNameDynamicBlock = construct(block.printPersonNameBlock);
    
    parse = parseDynamicBlock;
    fromCeylon = RedHatTransformer.transformDynamicBlock;
    toCeylon = dynamicBlockToCeylon;
    codes = [printPersonNameDynamicBlock];
}
