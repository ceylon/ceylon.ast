String[] keywords = [
    "assembly", "module", "package", "import",
    "alias", "class", "interface", "object", "given", "value", "assign", "void", "function", "new",
    "of", "extends", "satisfies", "abstracts",
    "in", "out",
    "return", "break", "continue", "throw",
    "assert", "dynamic",
    "if", "else", "switch", "case", "for", "while", "try", "catch", "finally", "then", "let",
    "this", "outer", "super",
    "is", "exists", "nonempty"
];

shared alias TypeName => UIdentifier;
shared alias MemberName => LIdentifier;
shared alias PackageName => LIdentifier;

shared Boolean lidentifierNeedsPrefix(String name) {
    "Name must not be empty"
    assert (exists firstChar = name.first);
    return firstChar.uppercase || name in keywords;
}
shared Boolean uidentifierNeedsPrefix(String name) {
    "Name must not be empty"
    assert (exists firstChar = name.first);
    return firstChar.lowercase || firstChar == '_'; // there are no initial uppercase keywords
}

shared abstract class Identifier(name, usePrefix) of LIdentifier | UIdentifier extends Node() {
    
    "The name of the identifier."
    shared default String name;
    
    """If [[true]], use the `\i`/`\I` [[prefix]].
       
       This property is only of concern to tools which deal immediately with source code;
       it does not influence the equality of `Identifier` instances.
       
       (If this is [[false]] and the [[name]] requires a prefix,
       an [[AssertionError]] is thrown.)"""
    shared default Boolean usePrefix;
    "The prefix for this kind of identifier – `\\i` for a [[lowercase identifier|LIdentifier]],
     `\\I` for an [[uppercase identifier|UIdentifier]]."
    shared formal String prefix;
    
    shared actual [] children = [];
    
    "The text of the identifier, that is its [[name]] and, if [[used|usePrefix]], the prefix."
    shared String text => usePrefix then prefix + name else name;
    
    shared actual Integer hash
            => name.hash;
    
    "Creates a copy of this identifier.
     All parameters default to the value of the corresponding parameter of this instance."
    shared formal Identifier copy(String name = this.name, Boolean usePrefix = this.usePrefix);
}

"An initial lowercase identifier."
shared class LIdentifier(String name, Boolean usePrefix = false) extends Identifier(name, usePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    "Prefix must be present if necessary"
    assert (usePrefix || !lidentifierNeedsPrefix(name));
    
    prefix = "\\i";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLIdentifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitLIdentifier(this);

    shared actual Boolean equals(Object that) {
        if (is LIdentifier that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual LIdentifier copy(String name, Boolean usePrefix) {
        value ret = LIdentifier(name, usePrefix);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"An initial uppercase identifier."
shared class UIdentifier(String name, Boolean usePrefix = false) extends Identifier(name, usePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    "Prefix must be present if necessary"
    assert (usePrefix || !uidentifierNeedsPrefix(name));
    
    prefix = "\\I";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUIdentifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitUIdentifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is UIdentifier that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual UIdentifier copy(String name, Boolean usePrefix) {
        value ret = UIdentifier(name, usePrefix);
        copyExtraInfoTo(ret);
        return ret;
    }
}
