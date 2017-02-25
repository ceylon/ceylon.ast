"A value constructor definition.
 
 A value constructor definition has the following components:
 - [[annotations]],
 - the `new` keyword,
 - the [[name]],
 - the [[extended type|extendedType]], if present, and
 - the [[block]].
 
 Examples (multi-line):
 
     shared new origin {
         x = 0.0; y = 0.0;
         r = 0.0; φ = 0.0;
     }
 
     shared new red {
         rgb = #FF0000;
     }"
shared class ValueConstructorDefinition(name, block, extendedType, annotations)
        extends ConstructorDefinition() {
    
    "The name of the constructor."
    shared actual LIdentifier name;
    "The block of the constructor."
    shared actual Block block;
    "The extended type of the constructor, if present."
    shared actual ExtendedType? extendedType;
    "The annotations of the constructor."
    shared actual Annotations annotations;
    
    parameters => null;
    
    shared actual <Annotations|LIdentifier|ExtendedType|Block>[] children
            = concatenate(
                [annotations],
                emptyOrSingleton(name),
                emptyOrSingleton(extendedType),
                [block]
            );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueConstructorDefinition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueConstructorDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueConstructorDefinition that) {
            if (exists extendedType) {
                if (exists extendedType_ = that.extendedType) {
                    if (extendedType != extendedType_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.extendedType exists) {
                return false;
            }
            return name==that.name && block==that.block && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (block.hash + 31 * ((extendedType?.hash else 0) + 31*annotations.hash)));
    
    shared ValueConstructorDefinition copy(LIdentifier name = this.name, Block block = this.block, ExtendedType? extendedType = this.extendedType, Annotations annotations = this.annotations) {
        value ret = ValueConstructorDefinition(name, block, extendedType, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
