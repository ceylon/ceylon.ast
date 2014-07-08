import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseExpressionToCeylon,
    compileBaseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression
    }
}

shared object baseExpression satisfies ConcreteTest<BaseExpression,JBaseMemberOrTypeExpression> {
    shared String->BaseExpression nullExpression = "null"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("null"), null));
    shared String->BaseExpression maxOfIntegerNothingExpression = "max<Integer,Nothing>"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("max"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))), BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing")))]));
    shared String->BaseExpression processExpression = "process"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("process")));
    
    shared actual BaseExpression? compile(String code) => compileBaseExpression(code);
    shared actual JBaseMemberOrTypeExpression fromCeylon(RedHatTransformer transformer)(BaseExpression node) => transformer.transformBaseExpression(node);
    shared actual BaseExpression toCeylon(JBaseMemberOrTypeExpression node) => baseExpressionToCeylon(node);
    codes = [nullExpression, maxOfIntegerNothingExpression];
}
