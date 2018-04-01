import ceylon.ast.core {
    Expression,
    Throw
}
import ceylon.ast.redhat {
    RedHatTransformer,
    throwToCeylon,
    parseThrow
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JThrow=Throw
    }
}

shared object \ithrow satisfies ConcreteTest<Throw,JThrow> {
    
    String->Throw construct(<String->Expression>? result = null)
            => "throw `` result?.key else "" ``;" -> Throw(result?.item);
    
    shared String->Throw \ithrow = construct();
    shared String->Throw throwAssertionError = construct(invocation.assertionErrorInvocation);
    
    parse = parseThrow;
    fromCeylon = RedHatTransformer.transformThrow;
    toCeylon = throwToCeylon;
    codes = [\ithrow, throwAssertionError];
}
