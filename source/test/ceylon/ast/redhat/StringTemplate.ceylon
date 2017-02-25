import ceylon.ast.core {
    ElseOperation,
    StringTemplate,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    stringTemplateToCeylon,
    parseStringTemplate
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStringTemplate=StringTemplate
    }
}
import ceylon.ast.create {
    createStringTemplate=stringTemplate
}

shared object stringTemplate satisfies ConcreteTest<StringTemplate,JStringTemplate> {
    
    shared String->StringTemplate helloNameElseWorldStringTemplate
            = """"Hello, `` process.arguments.first else "World" ``!"""" -> createStringTemplate(
                StringLiteral("Hello, "),
                ElseOperation(qualifiedExpression.processArgumentsFirstExpression.item, StringLiteral("World")),
                StringLiteral("!")
            );
    shared String->StringTemplate ifElseExpressionStringTemplate
            = "\"\`\```ifElseExpression.ifThenIfElseLetExpression.key``\`\`\"" -> createStringTemplate(
                StringLiteral(""),
                ifElseExpression.ifThenIfElseLetExpression.item,
                StringLiteral("")
            );
    shared String->StringTemplate emptyPartsStringTemplate
            = """"``0````0``"""" -> createStringTemplate(
                StringLiteral(""),
                integerLiteral._0IntegerLiteral.item,
                StringLiteral(""),
                integerLiteral._0IntegerLiteral.item,
                StringLiteral("")
            );
    shared String->StringTemplate multilineStringTemplate
            = """"Line 1
                  Line ``2``
                  Line 3"""" -> createStringTemplate(
                StringLiteral("""Line 1
                                 Line """),
                integerLiteral._2IntegerLiteral.item,
                StringLiteral("""
                                 Line 3""")
            );
    
    // not tested directly, but used by other tests
    shared String->StringTemplate xyStringTemplate
            = """"(``x``|``y``)"""" -> createStringTemplate(
                StringLiteral("("),
                baseExpression.xExpression.item,
                StringLiteral("|"),
                baseExpression.yExpression.item,
                StringLiteral(")")
            );
    
    parse = parseStringTemplate;
    fromCeylon = RedHatTransformer.transformStringTemplate;
    toCeylon = stringTemplateToCeylon;
    codes = [helloNameElseWorldStringTemplate, ifElseExpressionStringTemplate, emptyPartsStringTemplate, multilineStringTemplate];
}
