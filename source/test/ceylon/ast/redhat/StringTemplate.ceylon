import ceylon.ast.core {
    ElseOperation,
    StringTemplate,
    StringLiteral,
    stringTemplateUtil=stringTemplate
}
import ceylon.ast.redhat {
    RedHatTransformer,
    stringTemplateToCeylon,
    compileStringTemplate
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStringTemplate=StringTemplate
    }
}

shared object stringTemplate satisfies ConcreteTest<StringTemplate,JStringTemplate> {
    
    shared String->StringTemplate helloNameElseWorldStringTemplate
            = """"Hello, `` process.arguments.first else "World" ``!""""->stringTemplateUtil(
        StringLiteral("Hello, "),
        ElseOperation(qualifiedExpression.processArgumentsFirstExpression.item, StringLiteral("World")),
        StringLiteral("!")
    );
    
    compile = compileStringTemplate;
    fromCeylon = RedHatTransformer.transformStringTemplate;
    toCeylon = stringTemplateToCeylon;
    codes = [helloNameElseWorldStringTemplate];
}
