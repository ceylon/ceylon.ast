import ceylon.ast.core {
    Type,
    TypeArgument,
    TypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeArgumentsToCeylon,
    compileTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeArgumentList=TypeArgumentList
    }
}

shared object typeArguments satisfies ConcreteTest<TypeArguments,JTypeArgumentList> {
    
    String->TypeArguments construct(<String->Type>+ typeArguments)
            => "<``",".join(typeArguments*.key)``>"->TypeArguments(typeArguments*.item.collect(TypeArgument));
    
    shared String->TypeArguments stringTypeArguments = construct(baseType.stringType);
    shared String->TypeArguments integerNothingTypeArguments = construct(baseType.integerType, baseType.nothingType);
    
    compile = compileTypeArguments;
    fromCeylon = RedHatTransformer.transformTypeArguments;
    toCeylon = typeArgumentsToCeylon;
    codes = [stringTypeArguments];
}
