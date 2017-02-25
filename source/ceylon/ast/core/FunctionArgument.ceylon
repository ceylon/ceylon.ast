"""An inline function argument definition.
   
   Examples (multi-line):
   
       void onClick() {
           DialogBox { message = "Hello!"; parent = this; }.show();
       }
   
       void onError(dynamic err)
               => console.error(err);"""
shared class FunctionArgument(name, type, parameterLists, definition)
        extends InlineDefinitionArgument() {
    
    "The name of the function,
     as well as of the parameter it’s assigned to."
    shared actual LIdentifier name;
    "The type of the function.
     
     This can be:
     - a [[Type]],
     - a [[‘`void`’ modifier|VoidModifier]] for a function that does not return a value,
     - a [[‘`function`’ modifier|FunctionModifier]] for a function with inferred type,
     - a [[‘`dynamic’` modifier|DynamicModifier]] for a dynamically typed function."
    shared Type|VoidModifier|FunctionModifier|DynamicModifier type;
    "The parameter lists of the function."
    shared [Parameters+] parameterLists;
    "The definition of the function.
     
     If this is a [[LazySpecifier]], then the argument is terminated by a semicolon."
    shared Block|LazySpecifier definition;
    
    shared actual [Type|VoidModifier|FunctionModifier|DynamicModifier, LIdentifier, <Parameters|Block|LazySpecifier>+] children
            = [type, name, parameterLists.first, *concatenate(parameterLists.rest, [definition])];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionArgument(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitFunctionArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionArgument that) {
            return name==that.name && type==that.type && parameterLists==that.parameterLists && definition==that.definition;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (parameterLists.hash + 31*definition.hash)));
    
    shared FunctionArgument copy(LIdentifier name = this.name, Type|VoidModifier|FunctionModifier|DynamicModifier type = this.type, [Parameters+] parameterLists = this.parameterLists, Block|LazySpecifier definition = this.definition) {
        value ret = FunctionArgument(name, type, parameterLists, definition);
        copyExtraInfoTo(ret);
        return ret;
    }
}
