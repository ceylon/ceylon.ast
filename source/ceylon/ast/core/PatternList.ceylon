"A comma-separated list of specified patterns, enclosed in parentheses.
 
 Used in [[`let` expressions|LetExpression]].
 
 Examples:
 
     (c = other.a, d = other.b)
     ([x,y] = loc, dist = sqrt(x^2 + y^2))"
shared class PatternList(patterns)
        extends Node() {
    
    "The patterns of the pattern list."
    shared [SpecifiedPattern+] patterns;
    
    shared actual [SpecifiedPattern+] children = patterns;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPatternList(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPatternList(this);

    shared actual Boolean equals(Object that) {
        if (is PatternList that) {
            return patterns == that.patterns;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * patterns.hash;
    
    shared PatternList copy([SpecifiedPattern+] patterns = this.patterns) {
        value ret = PatternList(patterns);
        copyExtraInfoTo(ret);
        return ret;
    }
}
