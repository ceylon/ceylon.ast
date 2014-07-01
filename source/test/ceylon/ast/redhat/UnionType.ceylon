import ceylon.test {
    test
}
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
    compile=compileUnionType
}

test
shared void unionType()
        => doTest(compile, RedHatTransformer.transformUnionType, unionTypeToCeylon,
    "String|Integer|Float"->UnionType([
            BaseType(TypeNameWithTypeArguments(UIdentifier("String"))),
            BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
            BaseType(TypeNameWithTypeArguments(UIdentifier("Float")))
        ]),
    // from https://github.com/lucaswerkmeister/ceylon-typesystem-turing-complete/blob/eca01e028b71a8272480d16663f7e603be7a2fd8/source/ceylon/typesystem/demo/notDivisibleByThree/automaton.ceylon#L62
    " |\n".join {
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
    }
);
