import ceylon.ast.core {
    Block,
    Declaration,
    GroupedExpression,
    LIdentifier,
    Precedence18Expression,
    Return,
    Specifier,
    Statement,
    ValueSpecification,
    Editor
}

"Rewrites all returns in a block to specifications of the [[named value|returnValueName]].
 
 For example,
 ~~~
 if (condition) {
     return a;
 } else {
     return b;
 }
 ~~~
 is rewritten to
 ~~~
 if (condition) {
     returnValue = a;
 } else {
     returnValue = b;
 }
 ~~~
 You should only use this if the block [[has no early returns|hasEarlyReturns]],
 otherwise this changes the semantics of the block.
 
 Usage:
 
     rewrittenBlock= someBlock.transform(RewriteReturnsEditor(returnValueName));"
shared class RewriteReturnsEditor(LIdentifier returnValueName) satisfies Editor {
    
    "Rewrites a single return statement to a value specification,
     or returns [[null]] if the return statement has no [[result|Return.result]]."
    ValueSpecification? rewriteReturn(Return ret) {
        if (exists result = ret.result) {
            Precedence18Expression expression;
            if (is Precedence18Expression result) {
                expression = result;
            } else {
                expression = GroupedExpression(result);
            }
            return ValueSpecification(returnValueName, Specifier(result));
        } else {
            return null;
        }
    }
    
    shared actual Block transformBlock(Block that)
            => that.copy(that.content.map((Declaration|Statement that) {
                if (is Return that) {
                    return rewriteReturn(that);
                } else {
                    assert (is Declaration|Statement ret = that.transform(this));
                    return ret;
                }
            }).coalesced.sequence());
    
    // shortcuts to do less copying
    transformStatement(Statement that) => that;
    transformDeclaration(Declaration that) => that;
}
