import ceylon.ast.core {
    Annotations,
    Assertion,
    Conditions
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assertionToCeylon,
    compileAssertion
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssertion=Assertion
    }
}

shared object assertion satisfies ConcreteTest<Assertion,JAssertion> {
    
    String->Assertion construct(String->Conditions conditions, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` assert``conditions.key``;"->Assertion(conditions.item, annotations.item);
    
    shared String->Assertion unannotatedAssertion = construct(conditions.trueCommaAAndBConditions);
    shared String->Assertion annotatedAssertion = construct(conditions.trueCommaAAndBConditions, annotations.helloSharedByLucasAnnotations);
    
    compile = compileAssertion;
    fromCeylon = RedHatTransformer.transformAssertion;
    toCeylon = assertionToCeylon;
    codes = [unannotatedAssertion, annotatedAssertion];
}
