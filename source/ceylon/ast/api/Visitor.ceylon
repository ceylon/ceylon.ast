"An AST visitor.
 There is one method per AST node; override the methods for which you need to do something,
 and leave the others untouched.
 
 The default operation for most node types is to pass the visit up to the node’s supertype;
 for example, if you override only [[visitIdentifier]], you will receive calls to
 both [[LIdentifier.visit]] and [[UIdentifier.visit]], as the default operation for
 [[visitLIdentifier]] and [[visitUIdentifier]] is to delegate to [[visitIdentifier]].
 [[visitNode]] is different: As the root of the AST class hierarchy, it has no superclass;
 instead, it [[visits all the children|Node.visitChildren]] of the node.
 Thus, the default visitor will already traverse the AST fully,
 and if you need to perform some operation only for some node type that might appear
 anywhere in the AST, you can simply override that particular method and leave the rest as it is."
shared abstract class Visitor() {
    shared default void visitCharacterLiteral(CharacterLiteral that) => visitNode(that); // TODO visitLiteral(that);
    shared default void visitCompilationUnit(CompilationUnit that) => visitNode(that);
    shared default void visitFloatLiteral(FloatLiteral that) => visitNode(that); // TODO visitLiteral(that);
    shared default void visitIdentifier(Identifier that) => visitNode(that);
    shared default void visitIntegerLiteral(IntegerLiteral that) => visitNode(that); // TODO visitLiteral(that);
    shared default void visitLIdentifier(LIdentifier that) => visitIdentifier(that);
    shared default void visitNode(Node that) => that.visitChildren(this);
    shared default void visitStringLiteral(StringLiteral that) => visitNode(that); // TODO visitLiteral(that);
    shared default void visitUIdentifier(UIdentifier that) => visitIdentifier(that);
}
