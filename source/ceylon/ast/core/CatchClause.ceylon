"A ‘`catch`’ clause, that is,
 the keyword ‘`catch`’, followed by a [[variable]] (enclosed in parentheses) and a [[block]].
 
 Examples (multi-line):
 
     catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }
 
     catch (e) {
         console.error(e);
     }"
shared class CatchClause(variable, block)
        extends Node() {
    
    "The caught variable.
     
     Within the [[block]], it holds the value of the caught exception."
    shared UnspecifiedVariable variable;
    "The block that is executed when an exception of matching type is caught."
    shared Block block;
    
    shared actual [UnspecifiedVariable, Block] children = [variable, block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCatchClause(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCatchClause(this);

    shared actual Boolean equals(Object that) {
        if (is CatchClause that) {
            return variable == that.variable && block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (variable.hash + 31 * block.hash);
    
    shared CatchClause copy(UnspecifiedVariable variable = this.variable, Block block = this.block) {
        value ret = CatchClause(variable, block);
        copyExtraInfoTo(ret);
        return ret;
    }
}
