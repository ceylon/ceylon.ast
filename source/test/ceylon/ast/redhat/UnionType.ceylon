import ceylon.ast.core {
    BaseType,
    IntersectionType,
    TypeNameWithTypeArguments,
    UIdentifier,
    UnionType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionTypeToCeylon,
    compileUnionType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionType=UnionType
    }
}

shared object unionType satisfies ConcreteTest<UnionType,JUnionType> {
    shared String->UnionType stringOrIntegerOrFloatUnionType
            = "``baseType.stringType.key``|``baseType.integerType.key``|``baseType.floatType.key``"->UnionType([baseType.stringType.item, baseType.integerType.item, baseType.floatType.item]);
    "From the [Ceylon Type System Turing Machine](https://github.com/lucaswerkmeister/ceylon-typesystem-turing-complete/blob/eca01e028b71a8272480d16663f7e603be7a2fd8/source/ceylon/typesystem/demo/notDivisibleByThree/automaton.ceylon#L62)."
    shared String->UnionType turingStuffUnionType
            = " |\n".join {
        for (i in 0..2)
            for (j in 0..2)
                "S&Q``i``&C&R``j``&B<Q`` (i + j) % 3 ``>"
    }->UnionType {
        children = [
            for (i in 0..2)
                for (j in 0..2)
                    IntersectionType {
                        children = [
                            BaseType(TypeNameWithTypeArguments(UIdentifier("S"))),
                            BaseType(TypeNameWithTypeArguments(UIdentifier("Q``i``"))),
                            BaseType(TypeNameWithTypeArguments(UIdentifier("C"))),
                            BaseType(TypeNameWithTypeArguments(UIdentifier("R``j``"))),
                            BaseType(TypeNameWithTypeArguments(UIdentifier("B"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Q`` (i + j) % 3 ``")))]))
                        ];
                    }
        ];
    };
    
    shared actual UnionType? compile(String code) => compileUnionType(code);
    shared actual JUnionType fromCeylon(RedHatTransformer transformer)(UnionType node) => transformer.transformUnionType(node);
    shared actual UnionType toCeylon(JUnionType node) => unionTypeToCeylon(node);
    codes = [stringOrIntegerOrFloatUnionType, turingStuffUnionType];
}
