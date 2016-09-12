import ceylon.ast.core {
    Block,
    Conditions,
    While
}
import ceylon.ast.redhat {
    RedHatTransformer,
    whileToCeylon,
    parseWhile
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JWhileStatement=WhileStatement
    }
}

shared object \iwhile satisfies ConcreteTest<While,JWhileStatement> {
    
    String->While construct(String->Conditions conditions, String->Block block = package.block.emptyBlock)
            => "while``conditions.key````block.key``"->While(conditions.item, block.item);
    
    shared String->While infiniteEmptyWhileLoop = construct(conditions.trueConditions);
    
    parse = parseWhile;
    fromCeylon = RedHatTransformer.transformWhile;
    toCeylon = whileToCeylon;
    codes = [infiniteEmptyWhileLoop];
}
