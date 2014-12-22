"An iterator for a ‘`for`’ loop, enclosed in parentheses.
 
 Examples:
 
     (person in people)
     (name->person in peopleByName)
     ([x, y] in coordinates)"
shared class ForIterator(pattern, iterated)
        extends Node() {
    
    "The iterator pattern."
    shared Pattern pattern;
    "The iterated expression."
    shared Expression iterated;
    
    shared actual [Pattern, Expression] children = [pattern, iterated];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformForIterator(this);
    
    shared actual Boolean equals(Object that) {
        if (is ForIterator that) {
            return pattern == that.pattern && iterated == that.iterated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (pattern.hash + 31 * iterated.hash);
    
    shared ForIterator copy(Pattern pattern = this.pattern, Expression iterated = this.iterated) {
        value ret = ForIterator(pattern, iterated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
