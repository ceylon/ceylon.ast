"""A ‘`for`’ loop with an optional failure clause, that is,
   a [[‘`for`’ clause|forClause]], optionally followed by an [[‘`else`’ failure clause|failClause]].
   
   Examples (multi-line):
   
       for (i in 1:12) {
           print(month(i));
       }
   
       for (person in people) {                                  
           if (!person.greeted) {
               print("Hello, ``person.name``!");
               break;
           }
       } else {
           print("Hello, World!");
       }"""
shared class ForFail(forClause, failClause = null)
        extends ControlStructure() {
    
    "The ‘`for`’ clause of the loop."
    shared ForClause forClause;
    "The ‘`else`’ failure clause of the loop, if present."
    shared FailClause? failClause;
    
    shared actual [ForClause, FailClause=] children = [forClause, *emptyOrSingleton(failClause)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformForFail(this);
    
    shared actual Boolean equals(Object that) {
        if (is ForFail that) {
            if (exists failClause) {
                if (exists failClause_ = that.failClause) {
                    if (failClause != failClause_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.failClause exists) {
                return false;
            }
            return forClause == that.forClause;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (forClause.hash + 31 * (failClause?.hash else 0));
    
    shared ForFail copy(ForClause forClause = this.forClause, FailClause? failClause = this.failClause) {
        value ret = ForFail(forClause, failClause);
        copyExtraInfoTo(ret);
        return ret;
    }
}
