"A modifier that indicates type inference.
 
 It can only be used on local definitions (not toplevel, not shared), hence the name."
shared abstract class LocalModifier()
        of ValueModifier | FunctionModifier
        extends TypeModifier() {
}
