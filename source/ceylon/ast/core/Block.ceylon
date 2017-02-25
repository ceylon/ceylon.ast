"""A list of statements and declarations, surrounded by braces.
   
   A block contains imperative code, a series of statements that is
   executed sequentially each time the block is entered (declarations
   can’t be executed). It may also return a value.
   
   A block may also include a list of [[imports]]
   that is local to this block only.
   
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
       }
       {
           import java.lang { System }
           System.arraycopy(src, srcPos, dest, destPos, length);
       }"""
shared class Block(content, imports = [])
        extends Body() {
    
    shared actual Import[] imports;
    shared actual <Declaration|Statement>[] content;
    
    shared actual <Import|Declaration|Statement>[] children = concatenate(imports, content);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBlock(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitBlock(this);
    
    shared actual Boolean equals(Object that) {
        if (is Block that) {
            return imports==that.imports && content==that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (imports.hash + 31*content.hash);
    
    shared Block copy(<Declaration|Statement>[] content = this.content, Import[] imports = this.imports) {
        value ret = Block(content, imports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
