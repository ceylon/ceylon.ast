import ceylon.ast.core {
    SpreadType,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spreadTypeToCeylon,
    compileSpreadType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpreadType=SpreadType
    }
}

shared object spreadType satisfies ConcreteTest<SpreadType,JSpreadType> {
    
    String->SpreadType construct(String->Type type)
            => "``type.key``"->SpreadType(type.item);
    
    shared String->SpreadType todo = construct(type.todo);
    
    compile = compileSpreadType;
    fromCeylon = RedHatTransformer.transformSpreadType;
    toCeylon = spreadTypeToCeylon;
    codes = [todo];
}
