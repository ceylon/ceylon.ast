import ceylon.ast.core {
    KeySubscript,
    Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    keySubscriptToCeylon,
    parseKeySubscript
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JElement=Element
    }
}

shared object keySubscript satisfies ConcreteTest<KeySubscript,JElement> {
    
    String->KeySubscript construct(String->Expression key)
            => "``key.key``" -> KeySubscript(key.item);
    
    shared String->KeySubscript iKeySubscript = construct(baseExpression.iExpression);
    shared String->KeySubscript aTimesBPlusCSubscript = construct(sumOperation.aTimesBPlusCExpression);
    shared String->KeySubscript xElseOneSubscript = construct(elseOperation.xElseOneOperation);
    
    parse = parseKeySubscript;
    fromCeylon = RedHatTransformer.transformKeySubscript;
    toCeylon = keySubscriptToCeylon;
    codes = [iKeySubscript, aTimesBPlusCSubscript, xElseOneSubscript];
}
