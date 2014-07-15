import ceylon.ast.core {
    IsOperation,
    Precedence10Expression,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    isOperationToCeylon,
    compileIsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsOp=IsOp
    }
}

shared object isOperation satisfies ConcreteTest<IsOperation,JIsOp> {
    
    String->IsOperation construct(String->Precedence10Expression operand, String->Type type)
            => "``operand.key`` is ``type.key``"->IsOperation(operand.item, type.item);
    
    shared String->IsOperation aIsPersistentAndPrintableAndIdentifiableExpression = construct(baseExpression.aExpression, intersectionType.persistentAndPrintableAndIdentifiableIntersectionType);
    
    compile = compileIsOperation;
    fromCeylon = RedHatTransformer.transformIsOperation;
    toCeylon = isOperationToCeylon;
    codes = [aIsPersistentAndPrintableAndIdentifiableExpression];
}
