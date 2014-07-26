"A modifier keyword.
 
 Note: The Ceylon Language Specification also refers to certain annotations,
 e. g. [[shared]], [[abstract]], [[variable]], etc., as “modifiers” – see §7.4.1,
 Declaration Modifiers.
 In `ceylon.ast`, however, `Modifier` refers only to the reserved keywords that can
 be used on a function:
 
 - `dynamic` – [[DynamicModifier]]
 - `void` – [[VoidModifier]]
 - `function` – [[FunctionModifier]]
 - `value` – [[ValueModifier]]"
shared abstract class Modifier()
        of DynamicModifier
        extends ExpressionIsh() {
    
    "The text / keyword of the modifier."
    shared formal String text;
    
    shared actual [] children = [];
}
