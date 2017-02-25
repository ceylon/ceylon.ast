import ceylon.ast.core {
    Body,
    ControlStructure,
    IfElse,
    Return,
    Visitor
}

"Determines if a body contains an early return.
 
 In a body without early returns, removing a return statement
 does not cause execution of additional statements, because
 no statements occurred behind the return in the original body.
 
 For example, this body contains an early return:
 ~~~
 if (condition) {
     return a;
 }
 return b;
 ~~~
 On the other hand, this one has no early returns:
 ~~~
 if (condition) {
     return a;
 } else {
     return b;
 }
 ~~~"
shared Boolean hasEarlyReturns(Body body) {
    class VisitAbortion() extends Exception("Abort visit") {}
    try {
        body.visit {
            object visitor satisfies Visitor {
                
                variable Boolean returnAllowed = true;
                
                shared actual void visitBody(Body that) {
                    that.children.last?.visit(this);
                    returnAllowed = false;
                    for (statement in that.children[... that.children.size-2]) {
                        statement.visit(this);
                    }
                }
                
                shared actual void visitIfElse(IfElse that) {
                    value myReturnAllowed = returnAllowed;
                    that.ifClause.block.visit(this);
                    returnAllowed = myReturnAllowed;
                    that.elseClause?.visit(this);
                }
                
                shared actual void visitControlStructure(ControlStructure that) {
                    returnAllowed = false;
                    super.visitControlStructure(that);
                }
                
                shared actual void visitReturn(Return that) {
                    if (!returnAllowed) {
                        throw VisitAbortion();
                    }
                }
            }
        };
        return false;
    } catch (VisitAbortion va) {
        return true;
    }
}
