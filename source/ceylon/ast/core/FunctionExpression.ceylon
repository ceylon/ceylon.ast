"""An expression that returns a callable function.
   
   Unlike [[value expressions|ValueExpression]], function expressions don’t return instances of classes.
   
   Examples (multi-line):
   
       (String? name) => name else "John Doe"
   
       (String string) {
           value mid = string.size / 2;
           return [string[...mid], [string[mid+1...]];
       }"""
shared class FunctionExpression(parameterLists, definition, type = null)
        extends Expression() {
    
    "The parameter lists of the function expression."
    shared [Parameters+] parameterLists;
    "The definition of the function expression."
    shared LazySpecifier|Block definition;
    "The type of the function expression:
     - a [[‘`function`’ modifier|FunctionModifier]] for explicit type inference,
     - a [[‘`void`’ modifier|VoidModifier]] for a function without a return value, or
     - [[no type|null]] for implicit type inference."
    shared FunctionModifier|VoidModifier? type;
    
    shared actual <FunctionModifier|VoidModifier|Parameters|LazySpecifier|Block>[] children = concatenate(emptyOrSingleton(type), parameterLists, [definition]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionExpression that) {
            if (exists type) {
                if (exists type_ = that.type) {
                    if (type != type_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.type exists) {
                return false;
            }
            return parameterLists == that.parameterLists && definition == that.definition;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameterLists.hash + 31 * (definition.hash + 31 * (type?.hash else 0)));
    
    shared FunctionExpression copy([Parameters+] parameterLists = this.parameterLists, LazySpecifier|Block definition = this.definition, FunctionModifier|VoidModifier? type = this.type) {
        value ret = FunctionExpression(parameterLists, definition, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
