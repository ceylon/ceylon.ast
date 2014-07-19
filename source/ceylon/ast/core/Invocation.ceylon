"""An invocation, that is, an invoked expression with an argument list.
   
   Examples:
   
       print("Hello, World!")
       process.kill()
       ArrayList { initialCapacity = 100; 1, 1 }"""
shared class Invocation(invoked, arguments)
        extends Primary() {
    
    "The invoked expression."
    shared Primary invoked;
    "The arguments."
    shared Arguments arguments;
    
    shared actual [Primary, Arguments] children = [invoked, arguments];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInvocation(this);
    
    shared actual Boolean equals(Object that) {
        if (is Invocation that) {
            return invoked == that.invoked && arguments == that.arguments;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (invoked.hash + 31 * arguments.hash);
    
    shared Invocation copy(Primary invoked = this.invoked, Arguments arguments = this.arguments) {
        value ret = Invocation(invoked, arguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}
