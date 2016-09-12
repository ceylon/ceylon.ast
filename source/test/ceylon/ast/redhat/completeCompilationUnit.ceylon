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
    parseCompilationUnit,
    TokenSourceTokenFactory
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
import org.antlr.runtime {
    BufferedTokenStream
}

object completeCompilationUnit satisfies ConcreteTest<CompilationUnit,JCompilationUnit> {
    
    value sb = StringBuilder();
    value tokens = TokenSourceTokenFactory();
    format {
        node = completeCU.transform(RedHatTransformer(tokens));
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
        tokens = BufferedTokenStream(tokens);
    };
    
    parse = parseCompilationUnit;
    fromCeylon = RedHatTransformer.transformCompilationUnit;
    toCeylon = compilationUnitToCeylon;
    codes = [sb.string->completeCU];
}
