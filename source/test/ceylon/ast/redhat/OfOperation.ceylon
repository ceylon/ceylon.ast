import ceylon.ast.core {
    OfOperation,
    Precedence10Expression,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ofOperationToCeylon,
    compileOfOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOfOp=OfOp
    }
}

shared object ofOperation satisfies ConcreteTest<OfOperation,JOfOp> {
    
    String->OfOperation construct(String->Precedence10Expression operand, String->Type type)
            => "``operand.key`` of ``type.key``"->OfOperation(operand.item, type.item);
    
    shared String->OfOperation stringOfStringOptionalExpression = construct(stringLiteral.capitalCStringLiteral, optionalType.stringOptionalType);
    
    compile = compileOfOperation;
    fromCeylon = RedHatTransformer.transformOfOperation;
    toCeylon = ofOperationToCeylon;
    codes = [stringOfStringOptionalExpression];
}