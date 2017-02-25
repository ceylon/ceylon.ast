"An if/else conditional.
 
 The conditional begins with an [[`if` clause|ifClause]] and may then optionally
 be followed by a chain of if/else clauses, optionally terminated by an `else` clause.
 
 Examples (multi-line):
 
     if (exists p = paragraphs.first) {
         setupAnchor(p);
         paragraphs.collect(output);
     } else if (exists div) {
         visit(div.paragraphs);
     } else {
         outputEmpty();
     }
 
     if (text.size >= terminalWidth) {
         print(text);
     } else if (text.size >= remainingWidth) {
         wrap();
         print(text);
         remainingWidth = terminalWidth - text.size;
     } else {
         print(text);
         remainingWidth -= text.size;
     }"
shared class IfElse(ifClause, elseClause)
        extends ControlStructure() {
    
    "The `if` clause."
    shared IfClause ifClause;
    "The `else` clause, if present."
    shared ElseClause? elseClause;
    
    shared actual [IfClause, ElseClause=] children = [ifClause, *emptyOrSingleton(elseClause)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIfElse(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIfElse(this);
    
    shared actual Boolean equals(Object that) {
        if (is IfElse that) {
            if (exists elseClause) {
                if (exists elseClause_ = that.elseClause) {
                    if (elseClause != elseClause_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.elseClause exists) {
                return false;
            }
            return ifClause == that.ifClause;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (ifClause.hash + 31 * (elseClause?.hash else 0));
    
    shared IfElse copy(IfClause ifClause = this.ifClause, ElseClause? elseClause = this.elseClause) {
        value ret = IfElse(ifClause, elseClause);
        copyExtraInfoTo(ret);
        return ret;
    }
}
