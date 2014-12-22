import ceylon.ast.core {
    Expression,
    ForIterator,
    Pattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    forIteratorToCeylon,
    compileForIterator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForIterator=ForIterator
    }
}

shared object forIterator satisfies ConcreteTest<ForIterator,JForIterator> {
    
    String->ForIterator construct(String->Pattern pattern, String->Expression iterated)
            => "(``pattern.key`` in ``iterated.key``)"->ForIterator(pattern.item, iterated.item);
    
    shared String->ForIterator variableIterator = construct(variablePattern.stringLineVariablePattern, baseExpression.textExpression);
    shared String->ForIterator entryDestructureIterator = construct(entryPattern.eToStringLineEntryPattern, baseExpression.peopleByNameExpression);
    shared String->ForIterator tupleDestructureIterator = construct(tuplePattern.firstRestTuplePattern, qualifiedExpression.processArgumentsExpression);
    
    compile = compileForIterator;
    fromCeylon = RedHatTransformer.transformForIterator;
    toCeylon = forIteratorToCeylon;
    codes = [variableIterator, entryDestructureIterator, tupleDestructureIterator];
}
