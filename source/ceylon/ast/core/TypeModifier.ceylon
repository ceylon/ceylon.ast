"A modifier that can be used instead of a type in some places.
 
 This includes:
 - the local modifiers ‘`value`’ and ‘`function`’, indicating type inference;
 - the ‘`void`’ modifier, indicating that a function doesn’t return a value; and
 - the ‘`dynamic`’ modifier, indicating absense of any typing information."
shared abstract class TypeModifier()
        of LocalModifier | VoidModifier | DynamicModifier
        extends Modifier() {
}
