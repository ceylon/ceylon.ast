import ceylon.ast.core {
    Body,
    Declaration,
    Statement
}

"Something that can readily be converted to a [[Body]]
 using the [[block]], [[classBody]] or [[interfaceBody]]
 utility functions."
shared alias BodyIsh => Body|{Declaration|Statement*};
