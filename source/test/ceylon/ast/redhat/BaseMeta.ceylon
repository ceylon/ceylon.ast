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
    compileBaseMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral
    }
}

shared object baseMeta satisfies ConcreteTest<BaseMeta,JMemberLiteral> {
    shared String->BaseMeta sumOfFloatBaseMeta = "`sum<Float>`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("sum"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Float")))]));
    shared String->BaseMeta systemBaseMeta = "`system`"->BaseMeta(MemberNameWithTypeArguments(LIdentifier("system"), null));
    
    shared actual BaseMeta? compile(String code) => compileBaseMeta(code);
    shared actual JMemberLiteral fromCeylon(RedHatTransformer transformer)(BaseMeta node) => transformer.transformBaseMeta(node);
    shared actual BaseMeta toCeylon(JMemberLiteral node) => baseMetaToCeylon(node);
    codes = [sumOfFloatBaseMeta, systemBaseMeta];
}
