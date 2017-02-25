import ceylon.ast.core {
    LIdentifier,
    Pattern,
    TuplePattern,
    UnionType,
    VariadicVariable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    tuplePatternToCeylon,
    parseTuplePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTuplePattern=TuplePattern
    }
}

shared object tuplePattern satisfies ConcreteTest<TuplePattern,JTuplePattern> {
    
    String->TuplePattern construct([<String->Pattern>*] elementPatterns, [String->LIdentifier, <String->UnionType>?]? variadicElementPattern = null) {
        if (exists variadicElementPattern) {
            String varCode;
            VariadicVariable varNode;
            value nameCode->nameNode = variadicElementPattern[0];
            if (exists typeCode->typeNode = variadicElementPattern[1]) {
                varCode = typeCode + " *" + nameCode;
                varNode = VariadicVariable(nameNode, typeNode);
            } else {
                varCode = "*" + nameCode;
                varNode = VariadicVariable(nameNode);
            }
            if (nonempty elementPatterns) {
                return "[``", ".join(elementPatterns*.key)``, ``varCode``]" -> TuplePattern(elementPatterns*.item, varNode);
            } else {
                return "[``varCode``]" -> TuplePattern([], varNode);
            }
        } else {
            return "[``", ".join(elementPatterns*.key)``]" -> TuplePattern(elementPatterns*.item);
        }
    }
    
    shared String->TuplePattern eStringLineTuplePattern = construct([variablePattern.eVariablePattern, variablePattern.stringLineVariablePattern]);
    shared String->TuplePattern firstRestTuplePattern = construct([variablePattern.firstVariablePattern], [identifier.restLIdentifier, null]);
    shared String->TuplePattern eTuplePattern = construct([], [identifier.eLIdentifier, null]);
    
    parse = parseTuplePattern;
    fromCeylon = RedHatTransformer.transformTuplePattern;
    toCeylon = tuplePatternToCeylon;
    codes = [eStringLineTuplePattern, firstRestTuplePattern, eTuplePattern];
}
