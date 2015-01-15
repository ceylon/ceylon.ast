import ceylon.ast.core {
    ConstructorDec,
    DecQualifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    constructorDecToCeylon,
    compileConstructorDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNewLiteral=NewLiteral
    }
}

shared object constructorDec satisfies ConcreteTest<ConstructorDec,JNewLiteral> {
    
    String->ConstructorDec construct(String->UIdentifier name, String->DecQualifier qualifier)
            => "`new ``qualifier.key``.``name.key```"->ConstructorDec(name.item, qualifier.item);
    
    shared String->ConstructorDec polarPointConstructorDec = construct(identifier.polarUIdentifier, "Point"->DecQualifier([UIdentifier("Point")]));
    
    compile = compileConstructorDec;
    fromCeylon = RedHatTransformer.transformConstructorDec;
    toCeylon = constructorDecToCeylon;
    codes = [polarPointConstructorDec];
}
