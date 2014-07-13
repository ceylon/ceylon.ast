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
    shared actual Precedence8Expression leftChild = key;
    "The [[item|Entry.item]] of the entry."
    see (`value item`)
    shared actual Precedence8Expression rightChild = item;
    
    shared actual [Precedence8Expression, Precedence8Expression] children = [leftChild, rightChild];
    
    operator = "->";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEntryOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is EntryOperation that) {
            return leftChild == that.leftChild && rightChild == that.rightChild;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftChild.hash + 31 * rightChild.hash);
    
    shared EntryOperation copy(Precedence8Expression leftChild = this.leftChild, Precedence8Expression rightChild = this.rightChild) {
        value ret = EntryOperation(leftChild, rightChild);
        copyExtraInfoTo(ret);
        return ret;
    }
}
