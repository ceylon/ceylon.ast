import ceylon.ast.core {
    Assertion,
    AssertionMessage,
    Conditions
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assertionToCeylon,
    parseAssertion
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAssertion=Assertion
    }
}

shared object assertion satisfies ConcreteTest<Assertion,JAssertion> {
    
    String->Assertion construct(String->Conditions conditions, <String->AssertionMessage>? message = null)
            => "`` message?.key else "" `` assert``conditions.key``;" -> Assertion(conditions.item, message?.item);
    
    shared String->Assertion undocumentedAssertion = construct(conditions.trueCommaAAndBConditions);
    shared String->Assertion literalDocumentedAssertion = construct(conditions.trueCommaAAndBConditions, stringLiteral.namedCapitalCStringLiteral);
    shared String->Assertion templateDocumentedAssertion = construct(conditions.trueCommaAAndBConditions, stringTemplate.helloNameElseWorldStringTemplate);
    
    parse = parseAssertion;
    fromCeylon = RedHatTransformer.transformAssertion;
    toCeylon = assertionToCeylon;
    codes = [undocumentedAssertion, literalDocumentedAssertion, templateDocumentedAssertion];
}
