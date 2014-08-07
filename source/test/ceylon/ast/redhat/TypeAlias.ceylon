import ceylon.ast.core {
    TypeAlias,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeAliasToCeylon,
    compileTypeAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object typeAlias satisfies ConcreteTest<TypeAlias,JAlias> {
    
    String->TypeAlias construct(String->UIdentifier name)
            => "``name.key``="->TypeAlias(name.item);
    
    shared String->TypeAlias uidTypeAlias = construct(identifier.uidUIdentifier);
    
    compile = compileTypeAlias;
    fromCeylon = RedHatTransformer.transformTypeAlias;
    toCeylon = typeAliasToCeylon;
    codes = [uidTypeAlias];
}
