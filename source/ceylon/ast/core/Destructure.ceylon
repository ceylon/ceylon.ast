"A destructuring statement, that is,
 the keyword ‘`let`’, followed by a [[list of patterns|patterns]]
 and terminated by a semicolon.
 
 Examples:
 
     let (name->[lat, lon] = observatories.first);
     let ([x,y,z] = pos, [α,β,γ] = dir);"
shared class Destructure(patterns)
        extends Statement() {
    
    "The patterns that the destructuring statement introduces."
    shared PatternList patterns;
    
    shared actual [PatternList] children = [patterns];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDestructure(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitDestructure(this);
    
    shared actual Boolean equals(Object that) {
        if (is Destructure that) {
            return patterns == that.patterns;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * patterns.hash;
    
    shared Destructure copy(PatternList patterns = this.patterns) {
        value ret = Destructure(patterns);
        copyExtraInfoTo(ret);
        return ret;
    }
}
