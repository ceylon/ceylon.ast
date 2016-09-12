import ceylon.ast.core {
    ExtensionOrConstruction,
    ExtendedType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    extendedTypeToCeylon,
    parseExtendedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExtendedType=ExtendedType
    }
}

shared object extendedType satisfies ConcreteTest<ExtendedType,JExtendedType> {
    
    String->ExtendedType construct(String->ExtensionOrConstruction target)
            => "extends ``target.key``"->ExtendedType(target.item);
    
    shared String->ExtendedType objectExtendedType = construct(extension.objectExtension);
    shared String->ExtendedType packageObjectExtendedType = construct(extension.packageObjectExtension);
    shared String->ExtendedType superInnerExtendedType = construct(extension.superInnerExtension);
    shared String->ExtendedType objectOfStringExtendedType = construct(extension.objectOfStringExtension);
    shared String->ExtendedType packageObjectOfStringExtendedType = construct(extension.packageObjectOfStringExtension);
    shared String->ExtendedType superInnerOfStringExtendedType = construct(extension.superInnerOfStringExtension);
    
    shared String->ExtendedType pointCartesianExtendedType = construct(construction.pointCartesianConstruction);
    shared String->ExtendedType withRgbExtendedType = construct(construction.withRgbConstruction);
    shared String->ExtendedType superCartesianExtendedType = construct(construction.superCartesianConstruction);
    shared String->ExtendedType pointCartesianOfStringExtendedType = construct(construction.pointCartesianOfStringConstruction);
    shared String->ExtendedType withRgbOfStringExtendedType = construct(construction.withRgbOfStringConstruction);
    shared String->ExtendedType superCartesianOfStringExtendedType = construct(construction.superCartesianOfStringConstruction);
    
    // not tested directly, but used by other tests
    shared String->ExtendedType extendsAnything = construct(extension.extendsAnything);
    shared String->ExtendedType extendsNull = construct(extension.extendsNull);
    
    parse = parseExtendedType;
    fromCeylon = RedHatTransformer.transformExtendedType;
    toCeylon = extendedTypeToCeylon;
    codes = [objectExtendedType, packageObjectExtendedType, superInnerExtendedType, objectOfStringExtendedType, packageObjectOfStringExtendedType, superInnerOfStringExtendedType,
        pointCartesianExtendedType, withRgbExtendedType, superCartesianExtendedType, pointCartesianOfStringExtendedType, withRgbOfStringExtendedType, superCartesianOfStringExtendedType];
}
