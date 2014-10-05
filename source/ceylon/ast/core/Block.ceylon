"""A list of statements and declarations, surrounded by braces.
   
   A block contains imperative code, a series of statements that is
   executed sequentially each time the block is entered (declarations
   can’t be executed). It may also return a value.
   
   Examples (multi-line):
   
       {
           print("``indent``BEGIN ``that``");
           value origIndent = indent;
           indent += indentLevel;
           that.visit(this);
           indent = origIndent;
           print("``indent``END ``that``");
       }
       {
           throw AssertionError("Not yet implemented!");
       }
       {
           if (exists first = s.first) {
               return String { first.lowercased, *s.rest };
           } else {
               return "";
           }
       }"""
shared class Block(content)
        extends Body() {
    
    shared actual <Declaration|Statement>[] content;
    
    shared actual <Declaration|Statement>[] children = content;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBlock(this);
    
    shared actual Boolean equals(Object that) {
        if (is Block that) {
            return content == that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * content.hash;
    
    shared Block copy(<Declaration|Statement>[] content = this.content) {
        value ret = Block(content);
        copyExtraInfoTo(ret);
        return ret;
    }
}


"Converts a [[stream of declarations and statements|content]]
 to a [[Block]]."
throws (`class AssertionError`, "If the [[content]] is a different kind of content.")
shared Block block(BodyIsh content) {
    if (is Body content) {
        "Cannot implicitly convert between different kinds of Body"
        assert (is Block content);
        return content;
    } else {
        assert (is {Declaration|Statement*} content);
        return Block(content.sequence());
    }
}
