import ceylon.ast.core {
    ConstructorDec,
    DecQualifier,
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    constructorDecToCeylon,
    parseConstructorDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JNewLiteral=NewLiteral
    }
}

shared object constructorDec satisfies ConcreteTest<ConstructorDec,JNewLiteral> {
    
    String->ConstructorDec construct(String->LIdentifier name, String->DecQualifier qualifier)
            => "`new ``qualifier.key``.``name.key```" -> ConstructorDec(name.item, qualifier.item);
    
    shared String->ConstructorDec polarPointConstructorDec = construct(identifier.polarLIdentifier, "Point" -> DecQualifier([UIdentifier("Point")]));
    
    parse = parseConstructorDec;
    fromCeylon = RedHatTransformer.transformConstructorDec;
    toCeylon = constructorDecToCeylon;
    codes = [polarPointConstructorDec];
}
