import ceylon.ast.core {
    Declaration
}
import ceylon.ast.redhat {
    RedHatTransformer,
    declarationToCeylon,
    parseDeclaration
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration
    }
}

shared object declaration satisfies AbstractTest<Declaration,JDeclaration> {
    parse = parseDeclaration;
    fromCeylon = RedHatTransformer.transformDeclaration;
    toCeylon = declarationToCeylon;
    
    tests = [typeDeclaration, typedDeclaration, objectDefinition, valueSetterDefinition, callableConstructorDefinition];
}
