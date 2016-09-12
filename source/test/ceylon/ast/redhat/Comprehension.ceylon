import ceylon.ast.core {
    Comprehension,
    InitialComprehensionClause
}
import ceylon.ast.redhat {
    RedHatTransformer,
    comprehensionToCeylon,
    parseComprehension
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehension=Comprehension
    }
}

shared object comprehension satisfies ConcreteTest<Comprehension,JComprehension> {
    
    String->Comprehension construct(String->InitialComprehensionClause clause)
            => "``clause.key``"->Comprehension(clause.item);
    
    shared String->Comprehension ifTrueCommaAAndBThenIComprehension = construct(ifComprehensionClause.ifTrueCommaAAndBThenIComprehensionClause);
    shared String->Comprehension forPersonInPeopleComprehension = construct(forComprehensionClause.forPersonInPeopleComprehensionClause);
    // TODO better tests
    
    parse = parseComprehension;
    fromCeylon = RedHatTransformer.transformComprehension;
    toCeylon = comprehensionToCeylon;
    codes = [ifTrueCommaAAndBThenIComprehension, forPersonInPeopleComprehension];
}
