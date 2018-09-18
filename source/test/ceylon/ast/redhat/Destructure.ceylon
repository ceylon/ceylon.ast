import ceylon.ast.core {
    Destructure,
    EntryPattern,
    LIdentifier,
    PatternList,
    SpecifiedPattern,
    Specifier,
    TuplePattern,
    UnspecifiedVariable,
    ValueModifier,
    VariablePattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    destructureToCeylon,
    parseDestructure
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JDestructure=Destructure,
        JLetStatement=LetStatement
    }
}

shared object destructure satisfies ConcreteTest<Destructure,JLetStatement> {
    
    String->Destructure construct([<String->SpecifiedPattern>+] patterns)
            => "let (``",".join(patterns*.key)``);" -> Destructure(PatternList(patterns*.item));
    
    shared String->Destructure firstRestTupleDestructure = construct(["[first, *rest] = process.arguments.sequence()" -> SpecifiedPattern(tuplePattern.firstRestTuplePattern.item, specifier.processArgumentsSequenceSpecifier.item)]);
    shared String->Destructure abcDestructure = construct([
            "a=1" -> SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("a"))), specifier.oneSpecifier.item),
            "b=0" -> SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("b"))), specifier._0Specifier.item),
            "c=1" -> SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("c"))), specifier.oneSpecifier.item)]);
    shared String->Destructure valueSyntaxDestructure = "value e -> String line = 1;" -> Destructure(PatternList([SpecifiedPattern(entryPattern.eToStringLineEntryPattern.item, specifier.oneSpecifier.item)]));
    
    parse = parseDestructure;
    fromCeylon = RedHatTransformer.transformDestructure;
    toCeylon = destructureToCeylon;
    codes = [firstRestTupleDestructure, abcDestructure, valueSyntaxDestructure];
}
