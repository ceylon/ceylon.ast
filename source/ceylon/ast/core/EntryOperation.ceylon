"An entry expression.
 
 Defined via [[Entry]]. No associativity.
 
 Examples:
 
     \"1\"->1
     name->Person(name)"
shared class EntryOperation(key, item)
        extends BinaryOperation() {
    
    "The [[key|Entry.key]] of the entry."
    shared AddingExpression key;
    "The [[item|Entry.item]] of the entry."
    shared AddingExpression item;
    
    "The [[key|Entry.key]] of the entry."
    see (`value key`)
    shared actual AddingExpression leftOperand = key;
    "The [[item|Entry.item]] of the entry."
    see (`value item`)
    shared actual AddingExpression rightOperand = item;
    
    shared actual [AddingExpression, AddingExpression] children = [leftOperand, rightOperand];
    
    operator = "->";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEntryOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitEntryOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EntryOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared EntryOperation copy(AddingExpression leftOperand = this.leftOperand, AddingExpression rightOperand = this.rightOperand) {
        value ret = EntryOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
