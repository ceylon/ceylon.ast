"`this`, `super`, `outer` and `package` are *self reference expressions*.
 The type of these expressions depends on the context in which they appear.
 
 While these expressions are interesting from a typing perspective,
 their AST nodes are actually really boring and completely stateless.
 In order to save some memory, you can reuse [[thisInstance]], [[superInstance]],
 [[outerInstance]] and [[packageInstance]] instead of creating new instances every time."
abstract shared class SelfReference()
        of This|Super|Outer|Package
        extends Expression([]) /* TODO extends Atom? */ {
}

"The value of this expression is the current instance, and its type is
 the immediately containing type.
 
 As this class is completely stateless, you can reuse [[thisInstance]]
 instead of creating new instances of this class in order to save memory."
shared class This() extends SelfReference() {
    hash = 1;
    shared This copy() => this;
    visit(Visitor visitor) => visitor.visitThis(this);
    edit(Editor editor) => editor.editThis(this);
    equals(Object that) => that is This;
}
shared This thisInstance = This();

"The value of this expression is the current instance, and its type is
 the intersection of the immediate superclass and all immediate superinterfaces
 of the current class.
 
 As this class is completely stateless, you can reuse [[superInstance]]
 instead of creating new instances of this class in order to save memory."
shared class Super() extends SelfReference() {
    hash = 2;
    shared Super copy() => this;
    visit(Visitor visitor) => visitor.visitSuper(this);
    edit(Editor editor) => editor.editSuper(this);
    equals(Object that) => that is Super;
}
shared Super superInstance = Super();

"The value of this expression is the current instance of the type which
 immediately contains the immediately containing type, and its type is
 assignable to that type.
 
 As this class is completely stateless, you can reuse [[outerInstance]]
 instead of creating new instances of this class in order to save memory."
shared class Outer() extends SelfReference() {
    hash = 3;
    shared Outer copy() => this;
    visit(Visitor visitor) => visitor.visitOuter(this);
    edit(Editor editor) => editor.editOuter(this);
    equals(Object that) => that is Outer;
}
shared Outer outerInstance = Outer();

"`package` isn’t actually an expression; it can be used to qualify
 and disambiguate a value or callable reference.
 
 As this class is completely stateless, you can reuse [[packageInstance]]
 instead of creating new instances of this class in order to save memory."
shared class Package() extends SelfReference() {
    hash = 4;
    shared Package copy() => this;
    visit(Visitor visitor) => visitor.visitPackage(this);
    edit(Editor editor) => editor.editPackage(this);
    equals(Object that) => that is Package;
}
shared Package packageInstance = Package();
