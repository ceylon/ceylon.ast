"An unqualified identifier with an optional list of type arguments.
 
 A base expression can refer to either:
 * a toplevel function, value, or class,
 * a function, value, or class in the current scope, or
 * a function, value, or class in the current block.
 
 (To create a `BaseExpression`, consider using the [[baseExpression]]
 utility function in order to make your code more readable.)
 
 Examples:
 
     null
     max<Integer,Nothing>"
see (`function baseExpression`)
shared class BaseExpression(nameAndArgs)
        extends Primary() {
    
    "The name and, if any, arguments."
    shared NameWithTypeArguments nameAndArgs;
    
    shared actual [NameWithTypeArguments] children = [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseExpression that) {
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * nameAndArgs.hash;
    
    shared BaseExpression copy(NameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = BaseExpression(nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A utility function to create a [[BaseExpression]] directly from a string,
   without having to use [[NameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       baseExpression("null") // null
       baseExpression("String") // String; not to be confused with baseType("String")!
       baseExpression("emptyOrSingleton", "Integer") // emptyOrSingleton<Integer>"""
shared BaseExpression baseExpression(String|Identifier name, String|Type* typeArguments) {
    Type toType(String|Type typeArgument) {
        switch (typeArgument)
        case (is String) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    Identifier identifier;
    switch (name)
    case (is String) {
        if (name.first?.uppercase else false) {
            identifier = uidentifier(name);
        } else {
            identifier = lidentifier(name);
        }
    }
    case (is Identifier) {
        identifier = name;
    }
    NameWithTypeArguments na;
    switch (identifier)
    case (is LIdentifier) { na = MemberNameWithTypeArguments(identifier, args); }
    case (is UIdentifier) { na = TypeNameWithTypeArguments(identifier, args); }
    return BaseExpression(na);
}
