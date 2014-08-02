import ceylon.ast.core {
    BaseMeta,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseMetaToCeylon,
    compileBaseMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object baseMeta satisfies ConcreteTest<BaseMeta,JMemberLiteral> {
    shared String->BaseMeta sumOfFloatBaseMeta = "`sum<Float>`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("sum"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))))])));
    shared String->BaseMeta systemBaseMeta = "`system`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("system"), null));
    
    compile = compileBaseMeta;
    fromCeylon = RedHatTransformer.transformBaseMeta;
    toCeylon = baseMetaToCeylon;
    codes = [sumOfFloatBaseMeta, systemBaseMeta];
}
