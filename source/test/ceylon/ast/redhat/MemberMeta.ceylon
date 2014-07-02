import ceylon.test {
    test
}
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
    compile=compileMemberMeta
}

test
shared void memberMeta()
        => doTest(compile, RedHatTransformer.transformMemberMeta, memberMetaToCeylon,
    "`person.say`"->MemberMeta(LIdentifier("person"), MemberNameWithTypeArguments(LIdentifier("say"))),
    "`system.milliseconds`"->MemberMeta(LIdentifier("system"), MemberNameWithTypeArguments(LIdentifier("milliseconds"))),
    "`Iterable<String>.collect<Integer?>`"->MemberMeta {
        qualifier = BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String")))]));
        nameAndArgs = MemberNameWithTypeArguments(LIdentifier("collect"), [OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))))]);
    }
);
