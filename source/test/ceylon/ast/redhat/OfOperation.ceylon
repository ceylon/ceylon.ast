import ceylon.ast.core {
    OfOperation,
    ExistsNonemptyExpression,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    ofOperationToCeylon,
    parseOfOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOfOp=OfOp
    }
}

shared object ofOperation satisfies ConcreteTest<OfOperation,JOfOp> {
    
    String->OfOperation construct(String->ExistsNonemptyExpression operand, String->Type type)
            => "``operand.key`` of ``type.key``"->OfOperation(operand.item, type.item);
    
    shared String->OfOperation stringOfStringOptionalExpression = construct(stringLiteral.capitalCStringLiteral, optionalType.stringOptionalType);
    
    parse = parseOfOperation;
    fromCeylon = RedHatTransformer.transformOfOperation;
    toCeylon = ofOperationToCeylon;
    codes = [stringOfStringOptionalExpression];
}
