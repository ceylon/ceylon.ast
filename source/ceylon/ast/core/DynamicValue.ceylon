"""A dynamic value expression, that is, the keyword ‘`value`’ followed by [[named arguments|NamedArguments]].
   
   Examples:
   
       value { error = 404; message = "not found"; }
       value {}"""
shared class DynamicValue(content)
        extends Atom() {
    
    "The content of the dynamic value."
    shared NamedArguments content;
    
    shared actual [NamedArguments] children = [content];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDynamicValue(this);
    
    shared actual Boolean equals(Object that) {
        if (is DynamicValue that) {
            return content == that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * content.hash;
    
    shared DynamicValue copy(NamedArguments content = this.content) {
        value ret = DynamicValue(content);
        copyExtraInfoTo(ret);
        return ret;
    }
}
