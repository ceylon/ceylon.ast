"A `while` loop, that is,
 the keyword ‘`while`’, followed by [[conditions]] and a [[block]].
 
 Examples:
 
     while (i++ <= count) { lines.add(process.readLine()); }
     while (!((elem = it.next()) is Finished)) { expressions.add(elem); literals.add(it.next()); }"
shared class While(conditions, block)
        extends ControlStructure() {
    
    "The condition list that determines when the loop terminates."
    shared Conditions conditions;
    "The block that is repeatedly executed."
    shared Block block;
    
    shared actual [Conditions, Block] children = [conditions, block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformWhile(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitWhile(this);

    shared actual Boolean equals(Object that) {
        if (is While that) {
            return conditions == that.conditions && block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31 * block.hash);
    
    shared While copy(Conditions conditions = this.conditions, Block block = this.block) {
        value ret = While(conditions, block);
        copyExtraInfoTo(ret);
        return ret;
    }
}
