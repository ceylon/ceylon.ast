"A [[pattern]] followed by a [[specifier]] that is assigned to the pattern.
 
 Examples:
 
     [head, *tail] = elements.sequence()
     name = people.filter((p) => p.age < 18).first?.name?.uppercased"
shared class SpecifiedPattern(pattern, specifier)
        extends Node() {
    
    "The pattern being assigned to."
    shared Pattern pattern;
    "The specifier expression."
    shared Specifier specifier;
    
    shared actual [Pattern, Specifier] children = [pattern, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifiedPattern(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpecifiedPattern(this);

    shared actual Boolean equals(Object that) {
        if (is SpecifiedPattern that) {
            return pattern == that.pattern && specifier == that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (pattern.hash + 31 * specifier.hash);
    
    shared SpecifiedPattern copy(Pattern pattern = this.pattern, Specifier specifier = this.specifier) {
        value ret = SpecifiedPattern(pattern, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
