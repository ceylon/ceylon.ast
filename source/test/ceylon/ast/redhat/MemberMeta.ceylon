import ceylon.ast.core {
    BaseType,
    LIdentifier,
    MemberMeta,
    MemberNameWithTypeArguments,
    OptionalType,
    PrimaryType,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberMetaToCeylon,
    parseMemberMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object memberMeta satisfies ConcreteTest<MemberMeta,JMemberLiteral> {
    
    String->MemberMeta construct(String->PrimaryType qualifier, <String->LIdentifier>|<String->MemberNameWithTypeArguments> nameAndArgs) {
        MemberNameWithTypeArguments actualNameAndArgs;
        switch (nameAndArgsItem = nameAndArgs.item)
        case (is LIdentifier) { actualNameAndArgs = MemberNameWithTypeArguments(nameAndArgsItem); }
        case (is MemberNameWithTypeArguments) { actualNameAndArgs = nameAndArgsItem; }
        return "` ``qualifier.key``.``nameAndArgs.key`` `" -> MemberMeta(qualifier.item, actualNameAndArgs);
    }
    
    shared String->MemberMeta personSayMemberMeta = construct(baseType.personObjectType, identifier.sayLIdentifier);
    shared String->MemberMeta systemMillisecondsMemberMeta = construct(baseType.systemObjectType, identifier.millisecondsLIdentifier);
    shared String->MemberMeta iterableOfStringCollectOfIntegerOptionalMemberMeta
            = construct(baseType.iterableOfStringType, "collect<Integer?>" -> MemberNameWithTypeArguments(LIdentifier("collect"), TypeArguments([TypeArgument(OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer")))))])));
    shared String->MemberMeta packageObjectEqualsMeta = construct(baseType.objectPackageQualifiedType, identifier.equalsLIdentifier);
    
    parse = parseMemberMeta;
    fromCeylon = RedHatTransformer.transformMemberMeta;
    toCeylon = memberMetaToCeylon;
    codes = [personSayMemberMeta, systemMillisecondsMemberMeta, iterableOfStringCollectOfIntegerOptionalMemberMeta, packageObjectEqualsMeta];
}
