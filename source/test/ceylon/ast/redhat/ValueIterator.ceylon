import ceylon.ast.core {
    Expression,
    LIdentifier,
    Type,
    UnspecifiedVariable,
    ValueIterator,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueIteratorToCeylon,
    compileValueIterator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueIterator=ValueIterator
    }
}

shared object valueIterator satisfies ConcreteTest<ValueIterator,JValueIterator> {
    
    String->ValueIterator construct(String->LIdentifier name, <String->Type|ValueModifier>? type, String->Expression iterated)
            => "(`` type?.key else "" `` ``name.key`` in ``iterated.key``)"->ValueIterator(UnspecifiedVariable(name.item, type?.item), iterated.item);
    
    shared String->ValueIterator personInPeopleIterator = construct(identifier.personLIdentifier, null, baseExpression.peopleExpression);
    shared String->ValueIterator characterCharInTextIterator = construct(identifier.charLIdentifier, baseType.characterType, baseExpression.textExpression);
    shared String->ValueIterator valuePersonInPeopleIterator = construct(identifier.personLIdentifier, valueModifier.valueModifier, baseExpression.peopleExpression);
    
    compile = compileValueIterator;
    fromCeylon = RedHatTransformer.transformValueIterator;
    toCeylon = valueIteratorToCeylon;
    codes = [personInPeopleIterator, characterCharInTextIterator, valuePersonInPeopleIterator];
}
