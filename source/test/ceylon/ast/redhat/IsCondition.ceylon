import ceylon.ast.core {
    IsCondition,
    LIdentifier,
    Specifier,
    Type,
    TypedVariable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    isConditionToCeylon,
    parseIsCondition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsCondition=IsCondition
    }
}

shared object isCondition satisfies ConcreteTest<IsCondition,JIsCondition> {
    
    String->IsCondition construct(String->LIdentifier name, String->Type type, <String->Specifier>? specifier = null, Boolean negated = false)
            => "`` negated then "!" else "" ``is ``type.key`` ``name.key`` `` specifier?.key else "" ``" -> IsCondition(TypedVariable(name.item, type.item, specifier?.item), negated);
    
    shared String->IsCondition isStringNameCondition = construct(identifier.nameLIdentifier, baseType.stringType);
    "    is {Character*} characters = name else \"World\""
    shared String->IsCondition isItCharactersCharactersSpecifiedCondition = construct(identifier.charactersLIdentifier, iterableType.characterStarIterableType, specifier.nameElseWorldStringLiteralGroupedSpecifier);
    shared String->IsCondition negatedIsStringNameCondition = construct(identifier.nameLIdentifier, baseType.stringType);
    
    parse = parseIsCondition;
    fromCeylon = RedHatTransformer.transformIsCondition;
    toCeylon = isConditionToCeylon;
    codes = [isStringNameCondition, isItCharactersCharactersSpecifiedCondition];
}
