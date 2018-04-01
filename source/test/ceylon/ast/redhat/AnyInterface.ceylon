import ceylon.ast.core {
    AnyInterface
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyInterfaceToCeylon,
    parseAnyInterface
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyInterface=AnyInterface
    }
}

shared object anyInterface satisfies AbstractTest<AnyInterface,JAnyInterface> {
    parse = parseAnyInterface;
    fromCeylon = RedHatTransformer.transformAnyInterface;
    toCeylon = anyInterfaceToCeylon;
    
    tests = [anyInterfaceDefinition, interfaceAliasDefinition];
}
