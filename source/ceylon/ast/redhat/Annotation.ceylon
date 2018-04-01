import ceylon.ast.core {
    Annotation,
    Arguments,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnnotation=Annotation,
        JBaseMemberExpression=BaseMemberExpression,
        JInferredTypeArguments=InferredTypeArguments
    }
}

"Converts a RedHat AST [[Annotation|JAnnotation]] to a `ceylon.ast` [[Annotation]]."
shared Annotation annotationToCeylon(JAnnotation annotation, Anything(JNode, Node) update = noop) {
    // Note: JAnnotation is a subclass of JInvocationExpression
    assert (is JBaseMemberExpression bme = annotation.primary);
    "Must not have type arguments"
    assert (bme.typeArguments is JInferredTypeArguments?);
    value name = aIdentifierToCeylon(bme.identifier, update);
    Arguments? arguments;
    if (exists positionalArgs = annotation.positionalArgumentList) {
        if (positionalArgs.mainToken exists) {
            // it’s a real argument list
            arguments = positionalArgumentsToCeylon(positionalArgs, update);
        } else {
            // faked argument list
            arguments = null;
        }
    } else if (exists namedArgs = annotation.namedArgumentList) {
        arguments = namedArgumentsToCeylon(namedArgs, update);
    } else {
        /*
         Note: The RedHat compiler never produces this
         (it produces a faked positional argument list, see above),
         but it seems reasonable to me to allow this.
         I’d suggest putting a breakpoint here though.
         */
        arguments = null;
    }
    value result = Annotation(name, arguments);
    update(annotation, result);
    return result;
}

"Parses the given [[code]] for an Annotation
 into an [[Annotation]] using the Ceylon compiler
 (more specifically, the rule for an `annotation`)."
shared Annotation? parseAnnotation(String code, Anything(JNode, Node) update = noop) {
    if (exists jAnnotation = createParser(code).annotation()) {
        return annotationToCeylon(jAnnotation, update);
    } else {
        return null;
    }
}
