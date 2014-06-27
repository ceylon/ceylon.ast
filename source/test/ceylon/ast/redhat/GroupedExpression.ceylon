import ceylon.test {
    test
}
import ceylon.ast.core {
    GroupedExpression,
    IntegerLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedExpressionToCeylon,
    compile=compileGroupedExpression
}

test
shared void groupedExpression()
        => doTest(compile, RedHatTransformer.transformGroupedExpression, groupedExpressionToCeylon,
    "(1)"->GroupedExpression(IntegerLiteral("1"))
);
