import ceylon.ast.core {
    ExistsCondition,
    LIdentifier,
    SpecifiedVariable,
    Specifier,
    Type,
    ValueModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    existsConditionToCeylon,
    compileExistsCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExistsCondition=ExistsCondition
    }
}

shared object existsCondition satisfies ConcreteTest<ExistsCondition,JExistsCondition> {
    
    String->ExistsCondition constructV(String->LIdentifier name, String->Specifier specifier, <String->Type|ValueModifier>? type = null)
            => "exists `` type?.key else "" `` ``name.key`` ``specifier.key``"->ExistsCondition(SpecifiedVariable(name.item, specifier.item, type?.item));
    
    String->ExistsCondition constructI(String->LIdentifier variable)
            => "exists ``variable.key``"->ExistsCondition(variable.item);
    
    shared String->ExistsCondition existsCeylonCondition = constructI(identifier.ceylonLIdentifier);
    shared String->ExistsCondition existsNameSpecifyCondition = constructV(identifier.nameLIdentifier, specifier.processArgumentsFirstSpecifier, baseType.stringType);
    shared String->ExistsCondition existsValueNameSpecifyCondition = constructV(identifier.nameLIdentifier, specifier.processArgumentsFirstSpecifier, valueModifier.valueModifier);
    shared String->ExistsCondition existsUntypedNameSpecifyCondition = constructV(identifier.nameLIdentifier, specifier.processArgumentsFirstSpecifier);
    
    compile = compileExistsCondition;
    fromCeylon = RedHatTransformer.transformExistsCondition;
    toCeylon = existsConditionToCeylon;
    codes = [existsCeylonCondition, existsNameSpecifyCondition, existsValueNameSpecifyCondition, existsUntypedNameSpecifyCondition];
}
