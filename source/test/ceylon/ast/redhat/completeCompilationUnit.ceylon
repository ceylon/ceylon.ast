import ceylon.ast.core {
    CompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.ast.redhat {
    RedHatTransformer,
    compilationUnitToCeylon,
    compileCompilationUnit,
    TokenFactoryImpl
}
import ceylon.ast.samples.completeCompilationUnit {
    completeCU=completeCompilationUnit
}
import ceylon.formatter {
    format
}
import ceylon.file {
    Writer
}

object completeCompilationUnit satisfies ConcreteTest<CompilationUnit,JCompilationUnit> {
    
    value sb = StringBuilder();
    format {
        node = completeCU.transform(RedHatTransformer(TokenFactoryImpl()));
        object output satisfies Writer {
            close() => flush();
            shared actual void flush() {}
            write(String string) => sb.append(string);
            shared actual void writeLine(String line) {
                throw AssertionError("Shouldn’t be used");
            }
            shared actual void writeBytes({Byte*} bytes) {
                throw AssertionError("Shouldn’t be used");
            }
        }
    };
    
    compile = compileCompilationUnit;
    fromCeylon = RedHatTransformer.transformCompilationUnit;
    toCeylon = compilationUnitToCeylon;
    codes = [sb.string->completeCU];
}
