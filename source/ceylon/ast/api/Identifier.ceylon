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

shared abstract class Identifier(name, enforcePrefix) of LIdentifier|UIdentifier extends Node([]) {
    
    "The name or text of the identifier."
    shared default String name;
    
    """If [[true]], enforce the `\i`/`\I` prefix.
       
       This property is only of concern to tools which deal immediately with source code;
       it does not influence the equality of `Identifier` instances."""
    shared default Boolean enforcePrefix;
    """Whether this identifier has a `\i`/`\I` prefix in code.
       The identifier has this prefix if it is [[enforced|enforcePrefix]]
       or if it is necessary because the text’s case doesn’t match
       that of the identifier, or because it’s a keyword (e. g. `\ithis`)."""
    shared formal Boolean usePrefix;
    
    shared actual Integer hash
            => name.hash;
    
    "The text of this identifier, that is its [[name]] and, if [[used|usePrefix]], the prefix."
    shared actual formal String string;
    
    "Creates a copy of this identifier.
     All parameters default to the value of the corresponding parameter of this instance."
    shared formal Identifier copy(String name = this.name, Boolean enforcePrefix = this.enforcePrefix);
}

"An initial lowercase identifier."
shared class LIdentifier(String name, Boolean enforcePrefix = false) extends Identifier(name, enforcePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    
    usePrefix
            = enforcePrefix || first.uppercase || name in keywords;
    
    visit(Visitor visitor) => visitor.visitLIdentifier(this);
    
    shared actual Boolean equals(Object other) {
        if (is LIdentifier other) {
            return name == other.name;
        } else {
            return false;
        }
    }
    
    shared actual LIdentifier copy(String name, Boolean enforcePrefix)
            => LIdentifier(name, enforcePrefix);
    
    string => usePrefix then "\\i" + name else name;
}

"An initial uppercase identifier."
shared class UIdentifier(String name, Boolean enforcePrefix = false) extends Identifier(name, enforcePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    
    usePrefix
            = enforcePrefix || first.lowercase || first == '_' /* || name in keywords */; // there are no uppercase keywords
    
    visit(Visitor visitor) => visitor.visitUIdentifier(this);
    
    shared actual Boolean equals(Object other) {
        if (is UIdentifier other) {
            return name == other.name;
        } else {
            return false;
        }
    }
    
    shared actual UIdentifier copy(String name, Boolean enforcePrefix)
            => UIdentifier(name, enforcePrefix);
    
    string => usePrefix then "\\I" + name else name;
}

"Parses an identifier from its text. The text may contain the prefix, but no escape sequences."
shared Identifier identifier(String text) {
    "Text must not be empty"
    assert (exists first = text.first);
    if (first == '\\') {
        if (text.startsWith("\\i")) {
            return LIdentifier(text[2...], true);
        } else if (text.startsWith("\\I")) {
            return UIdentifier(text[2...], true);
        } else {
            throw AssertionError("Identifier text can’t contain escape sequences");
        }
    } else {
        if (first.lowercase || first == '_') {
            return LIdentifier(text);
        } else {
            return UIdentifier(text);
        }
    }
}
