"""A `dynamic` block, that is, a [[block]] prefixed by the keyword ‘`dynamic`’.
   
   Examples (multi-line):
   
       dynamic {
           setTimeout(\iMath.random() * 1000, () => print("A message from the past"));
       }
   
       dynamic {
           console.log("Direct console access");
           console.dir(this); // I wonder what this looks like
       }"""
shared class DynamicBlock(block)
        extends ControlStructure() {
    
    "The block for which dynamic typing is enabled."
    shared Block block;
    
    // TODO should this have a DynamicModifier child?
    
    shared actual [Block] children = [block];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDynamicBlock(this);
    
    shared actual Boolean equals(Object that) {
        if (is DynamicBlock that) {
            return block == that.block;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * block.hash;
    
    shared DynamicBlock copy(Block block = this.block) {
        value ret = DynamicBlock(block);
        copyExtraInfoTo(ret);
        return ret;
    }
}
