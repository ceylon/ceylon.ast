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
    
    String->OfOperation construct(String->Precedence10Expression child, String->Type type)
            => "``child.key`` of ``type.key``"->OfOperation(child.item, type.item);
    
    shared String->OfOperation stringOfStringOptionalExpression = construct(stringLiteral.capitalCStringLiteral, optionalType.stringOptionalType);
    
    compile = compileOfOperation;
    fromCeylon = RedHatTransformer.transformOfOperation;
    toCeylon = ofOperationToCeylon;
    codes = [stringOfStringOptionalExpression];
}
