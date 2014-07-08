import ceylon.ast.core {
    BaseType,
    LIdentifier,
    MemberMeta,
    MemberNameWithTypeArguments,
    OptionalType,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    memberMetaToCeylon,
    compileMemberMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object memberMeta satisfies ConcreteTest<MemberMeta,JMemberLiteral> {
    shared String->MemberMeta personSayMemberMeta = "`person.say`"->MemberMeta(LIdentifier("person"), MemberNameWithTypeArguments(LIdentifier("say")));
    shared String->MemberMeta systemMillisecondsMemberMeta = "`system.milliseconds`"->MemberMeta(LIdentifier("system"), MemberNameWithTypeArguments(LIdentifier("milliseconds")));
    shared String->MemberMeta iterableOfStringCollectOfIntegerOptionalMemberMeta
            = "`Iterable<String>.collect<Integer?>`"->MemberMeta {
        qualifier = baseType.iterableOfStringType.item;
        nameAndArgs = MemberNameWithTypeArguments(LIdentifier("collect"), [OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))))]);
    };
    
    shared actual MemberMeta? compile(String code) => compileMemberMeta(code);
    shared actual JMemberLiteral fromCeylon(RedHatTransformer transformer)(MemberMeta node) => transformer.transformMemberMeta(node);
    shared actual MemberMeta toCeylon(JMemberLiteral node) => memberMetaToCeylon(node);
    codes = [personSayMemberMeta, systemMillisecondsMemberMeta, iterableOfStringCollectOfIntegerOptionalMemberMeta];
}
