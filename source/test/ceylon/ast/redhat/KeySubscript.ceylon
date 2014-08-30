import ceylon.ast.core {
    KeySubscript,
    Precedence8Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    keySubscriptToCeylon,
    compileKeySubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElement=Element
    }
}

shared object keySubscript satisfies ConcreteTest<KeySubscript,JElement> {
    
    String->KeySubscript construct(String->Precedence8Expression key)
            => "``key.key``"->KeySubscript(key.item);
    
    shared String->KeySubscript iKeySubscript = construct(baseExpression.iExpression);
    shared String->KeySubscript aTimesBPlusCSubscript = construct(sumOperation.aTimesBPlusCExpression);
    
    compile = compileKeySubscript;
    fromCeylon = RedHatTransformer.transformKeySubscript;
    toCeylon = keySubscriptToCeylon;
    codes = [iKeySubscript, aTimesBPlusCSubscript];
}
