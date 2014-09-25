import ceylon.ast.core {
    Annotations,
    TypeAliasDefinition,
    TypeConstraint,
    TypeParameters,
    TypeSpecifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeAliasDefinitionToCeylon,
    compileTypeAliasDefinition
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeAliasDeclaration=TypeAliasDeclaration
    }
}

shared object typeAliasDefinition satisfies ConcreteTest<TypeAliasDefinition,JTypeAliasDeclaration> {
    
    String->TypeAliasDefinition construct(String->UIdentifier name, String->TypeSpecifier specifier, <String->TypeParameters>? typeParameters = null, <String->TypeConstraint>[] typeConstraints = [], String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` alias ``name.key`` `` typeParameters?.key else "" `` ``" ".join(typeConstraints*.key)`` ``specifier.key``;"->TypeAliasDefinition(name.item, specifier.item, typeParameters?.item, typeConstraints*.item, annotations.item);
    
    shared String->TypeAliasDefinition todo = construct(identifier.typeNameUIdentifier, typeSpecifier.uidentifierTypeSpecifier);
    
    compile = compileTypeAliasDefinition;
    fromCeylon = RedHatTransformer.transformTypeAliasDefinition;
    toCeylon = typeAliasDefinitionToCeylon;
    codes = [todo];
}
