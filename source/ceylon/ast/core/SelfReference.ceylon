"`this`, `super`, `outer` and `package` are *self reference expressions*.
 The type of these expressions depends on the context in which they appear."
shared abstract class SelfReference()
        of This | Super | Outer | Package
        extends Atom() {
    shared formal SelfReference copy();
    
    shared actual [] children = [];
}

"The value of this expression is the current instance, and its type is
 the immediately containing type."
shared class This() extends SelfReference() {
    hash = 1;
    shared actual This copy() {
        value ret = This();
        copyExtraInfoTo(ret);
        return ret;
    }
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformThis(this);

    shared actual void visit(Visitor visitor)
            => visitor.visitThis(this);

    equals(Object that) => that is This;
}

"The value of this expression is the current instance, and its type is
 the intersection of the immediate superclass and all immediate superinterfaces
 of the current class."
shared class Super() extends SelfReference() {
    hash = 2;
    shared actual Super copy() {
        value ret = Super();
        copyExtraInfoTo(ret);
        return ret;
    }
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSuper(this);

    shared actual void visit(Visitor visitor)
            => visitor.visitSuper(this);

    equals(Object that) => that is Super;
}

"The value of this expression is the current instance of the type which
 immediately contains the immediately containing type, and its type is
 assignable to that type."
shared class Outer() extends SelfReference() {
    hash = 3;
    shared actual Outer copy() {
        value ret = Outer();
        copyExtraInfoTo(ret);
        return ret;
    }
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOuter(this);

    shared actual void visit(Visitor visitor)
            => visitor.visitOuter(this);

    equals(Object that) => that is Outer;
}

"`package` isn’t actually an expression; it can be used to qualify
 and disambiguate a value or callable reference."
shared class Package() extends SelfReference() {
    hash = 4;
    shared actual Package copy() {
        value ret = Package();
        copyExtraInfoTo(ret);
        return ret;
    }
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackage(this);

    shared actual void visit(Visitor visitor)
            => visitor.visitPackage(this);

    equals(Object that) => that is Package;
}
