"An entry expression.
 
 Defined via [[Entry]]. No associativity."
shared class EntryOperation(key, item)
        extends BinaryOperation() {
    
    "The [[key|Entry.key]] of the entry."
    shared Precedence8Expression key;
    "The [[item|Entry.item]] of the entry."
    shared Precedence8Expression item;
    
    "The [[key|Entry.key]] of the entry."
    see (`value key`)
    shared actual Precedence8Expression leftOperand = key;
    "The [[item|Entry.item]] of the entry."
    see (`value item`)
    shared actual Precedence8Expression rightOperand = item;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftOperand, rightOperand];
    
    operator = "->";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEntryOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EntryOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared EntryOperation copy(Precedence8Expression leftOperand = this.leftOperand, Precedence8Expression rightOperand = this.rightOperand) {
        value ret = EntryOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
