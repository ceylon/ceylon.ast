import ceylon.ast.core {
    ClassSpecifier,
    ExtensionOrConstruction
}
import ceylon.ast.redhat {
    RedHatTransformer,
    classSpecifierToCeylon,
    parseClassSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassSpecifier=ClassSpecifier
    }
}

shared object classSpecifier satisfies ConcreteTest<ClassSpecifier,JClassSpecifier> {
    
    String->ClassSpecifier construct(String->ExtensionOrConstruction target)
            => "=> ``target.key``"->ClassSpecifier(target.item);
    
    shared String->ClassSpecifier objectClassSpecifier = construct(extension.objectExtension);
    shared String->ClassSpecifier packageObjectClassSpecifier = construct(extension.packageObjectExtension);
    shared String->ClassSpecifier superInnerClassSpecifier = construct(extension.superInnerExtension);
    shared String->ClassSpecifier objectOfStringClassSpecifier = construct(extension.objectOfStringExtension);
    shared String->ClassSpecifier packageObjectOfStringClassSpecifier = construct(extension.packageObjectOfStringExtension);
    shared String->ClassSpecifier superInnerOfStringClassSpecifier = construct(extension.superInnerOfStringExtension);
    
    shared String->ClassSpecifier pointCartesianClassSpecifier = construct(construction.pointCartesianConstruction);
    shared String->ClassSpecifier withRgbClassSpecifier = construct(construction.withRgbConstruction);
    shared String->ClassSpecifier superCartesianClassSpecifier = construct(construction.superCartesianConstruction);
    shared String->ClassSpecifier pointCartesianOfStringClassSpecifier = construct(construction.pointCartesianOfStringConstruction);
    shared String->ClassSpecifier withRgbOfStringClassSpecifier = construct(construction.withRgbOfStringConstruction);
    shared String->ClassSpecifier superCartesianOfStringClassSpecifier = construct(construction.superCartesianOfStringConstruction);
    
    // not tested directly, but used by other tests
    shared String->ClassSpecifier classSpecifyStringCharacters = construct(extension.extendsStringCharacters);
    
    parse = parseClassSpecifier;
    fromCeylon = RedHatTransformer.transformClassSpecifier;
    toCeylon = classSpecifierToCeylon;
    codes = [objectClassSpecifier, packageObjectClassSpecifier, superInnerClassSpecifier, objectOfStringClassSpecifier, packageObjectOfStringClassSpecifier, superInnerOfStringClassSpecifier,
        pointCartesianClassSpecifier, withRgbClassSpecifier, superCartesianClassSpecifier, pointCartesianOfStringClassSpecifier, withRgbOfStringClassSpecifier, superCartesianOfStringClassSpecifier];
}
