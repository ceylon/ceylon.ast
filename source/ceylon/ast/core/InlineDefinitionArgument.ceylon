"A named argument that defines a getter, function, or anonymous class, and assigns it to a parameter.
 
 Examples (multi-line):
 
     void onSuccess(Result result) {
         print(result);
         logger.end(currentTask, result);
     }
 
     object destroyable satisfies Destroyable {
         shared actual void destroy(Anything error) => process.exit(1);
     }"
/*
 TODO
 The spec calls this “InlineDeclarationArgument”. I think they’re all definitions,
 not just declarations, but perhaps I’m wrong?
 
 (The RedHat AST has “TypedArgument”… which makes sense as well. However,
 in ceylon.ast, ObjectDefinition doesn’t extend TypedDeclaration.)
 */
shared abstract class InlineDefinitionArgument()
        of ValueArgument | FunctionArgument | ObjectArgument
        extends NamedArgument() {
    "The name of the getter, function, or object,
     as well as of the parameter it’s assigned to."
    shared formal MemberName name;
}
