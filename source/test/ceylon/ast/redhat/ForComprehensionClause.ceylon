import ceylon.ast.core {
    ComprehensionClause,
    ForComprehensionClause,
    ForIterator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    forComprehensionClauseToCeylon,
    compileForComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForComprehensionClause=ForComprehensionClause
    }
}

shared object forComprehensionClause satisfies ConcreteTest<ForComprehensionClause,JForComprehensionClause> {
    
    String->ForComprehensionClause construct(String->ForIterator iterator, String->ComprehensionClause clause)
            => "for ``iterator.key`` ``clause.key``"->ForComprehensionClause(iterator.item, clause.item);
    
    shared String->ForComprehensionClause forPersonInPeopleComprehensionClause = construct(valueIterator.personInPeopleIterator, ifComprehensionClause.ifTrueCommaAAndBThenIComprehensionClause);
    // TODO better tests
    
    compile = compileForComprehensionClause;
    fromCeylon = RedHatTransformer.transformForComprehensionClause;
    toCeylon = forComprehensionClauseToCeylon;
    codes = [forPersonInPeopleComprehensionClause];
}
