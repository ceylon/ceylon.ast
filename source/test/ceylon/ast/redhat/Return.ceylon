import ceylon.ast.core {
    Expression,
    Return
}
import ceylon.ast.redhat {
    RedHatTransformer,
    returnToCeylon,
    parseReturn
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JReturn=Return
    }
}

shared object \ireturn satisfies ConcreteTest<Return,JReturn> {
    
    String->Return construct(<String->Expression>? result = null)
            => "return `` result?.key else "" ``;" -> Return(result?.item);
    
    shared String->Return \ireturn = construct();
    shared String->Return returnHelloNameElseWorld = construct(stringTemplate.helloNameElseWorldStringTemplate);
    
    parse = parseReturn;
    fromCeylon = RedHatTransformer.transformReturn;
    toCeylon = returnToCeylon;
    codes = [\ireturn, returnHelloNameElseWorld];
}
