import ceylon.ast.core {
    Identifier,
    LIdentifier,
    UIdentifier,
    uidentifierNeedsPrefix,
    lidentifierNeedsPrefix
}

"Something that can readily be converted to an [[Identifier]]
 using the [[identifier]] utility function."
shared alias IdentifierIsh => Identifier|String;

"""Parses an identifier from its text. The text may contain the prefix, but no escape sequences.
   
   Examples:
   
       identifier("name")
       identifier("S_``state``")"""
shared Identifier identifier(IdentifierIsh text) {
    switch (text)
    case (is String) {
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
    case (is Identifier) { return text; }
}

"Utility function to create an [[LIdentifier]],
 [[with prefix|LIdentifier.usePrefix]] if and only if necessary."
shared LIdentifier lidentifier(String name)
        => LIdentifier(name, lidentifierNeedsPrefix(name));

"Utility function to create an [[UIdentifier]],
 [[with prefix|UIdentifier.usePrefix]] if and only if necessary."
shared UIdentifier uidentifier(String name)
        => UIdentifier(name, uidentifierNeedsPrefix(name));
