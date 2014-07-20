import ceylon.ast.core {
    Annotation,
    Arguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnnotation=Annotation,
        JBaseMemberExpression=BaseMemberExpression,
        JInferredTypeArguments=InferredTypeArguments
    }
}

"Converts a RedHat AST [[Annotation|JAnnotation]] to a `ceylon.ast` [[Annotation]]."
shared Annotation annotationToCeylon(JAnnotation annotation) {
    // Note: JAnnotation is a subclass of JInvocationExpression
    assert (is JBaseMemberExpression bme = annotation.primary);
    "Must not have type arguments"
    assert (bme.typeArguments is JInferredTypeArguments?);
    value name = aIdentifierToCeylon(bme.identifier);
    Arguments? arguments;
    if (exists positionalArgs = annotation.positionalArgumentList) {
        if (positionalArgs.mainToken exists) {
            // it’s a real argument list
            arguments = positionalArgumentsToCeylon(positionalArgs);
        } else {
            // faked argument list
            arguments = null;
        }
    } else if (exists namedArgs = annotation.namedArgumentList) {
        arguments = namedArgumentsToCeylon(namedArgs);
    } else {
        /*
         Note: The RedHat compiler never produces this
         (it produces a faked positional argument list, see above),
         but it seems reasonable to me to allow this.
         I’d suggest putting a breakpoint here though.
         */
        arguments = null;
    }
    return Annotation(name, arguments);
}

"Compiles the given [[code]] for an Annotation
 into an [[Annotation]] using the Ceylon compiler
 (more specifically, the rule for an `annotation`)."
shared Annotation? compileAnnotation(String code) {
    if (exists jAnnotation = createParser(code).annotation()) {
        return annotationToCeylon(jAnnotation);
    } else {
        return null;
    }
}
