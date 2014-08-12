import ceylon.ast.core {
    Block,
    ConditionList,
    While
}
import ceylon.ast.redhat {
    RedHatTransformer,
    whileToCeylon,
    compileWhile
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JWhileStatement=WhileStatement
    }
}

shared object \iwhile satisfies ConcreteTest<While,JWhileStatement> {
    
    String->While construct(String->ConditionList conditions, String->Block block = package.block.emptyBlock)
            => "while``conditions.key````block.key``"->While(conditions.item, block.item);
    
    shared String->While infiniteEmptyWhileLoop = construct(conditionList.trueConditionList);
    
    compile = compileWhile;
    fromCeylon = RedHatTransformer.transformWhile;
    toCeylon = whileToCeylon;
    codes = [infiniteEmptyWhileLoop];
}
