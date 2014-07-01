import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseMeta,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseMetaToCeylon,
    compile=compileBaseMeta
}

test
shared void baseMeta()
        => doTest(compile, RedHatTransformer.transformBaseMeta, baseMetaToCeylon,
    "`sum<Float>`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("sum"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Float")))])),
    "`system`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("system"), null))
);
