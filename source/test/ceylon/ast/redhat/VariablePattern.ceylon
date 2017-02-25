import ceylon.ast.core {
    UnspecifiedVariable,
    VariablePattern,
    LIdentifier,
    Type,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    variablePatternToCeylon,
    parseVariablePattern
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JVariablePattern=VariablePattern
    }
}

shared object variablePattern satisfies ConcreteTest<VariablePattern,JVariablePattern> {
    
    String->VariablePattern construct(String->LIdentifier name, <String->Type|ValueModifier>? type = null)
            => "`` type?.key else "" `` ``name.key``" -> VariablePattern(UnspecifiedVariable(name.item, type?.item));
    
    shared String->VariablePattern eVariablePattern = construct(identifier.eLIdentifier);
    shared String->VariablePattern firstVariablePattern = construct(identifier.firstLIdentifier);
    shared String->VariablePattern stringLineVariablePattern = construct(identifier.lineLIdentifier, baseType.stringType);
    
    parse = parseVariablePattern;
    fromCeylon = RedHatTransformer.transformVariablePattern;
    toCeylon = variablePatternToCeylon;
    codes = [eVariablePattern, firstVariablePattern, stringLineVariablePattern];
}
