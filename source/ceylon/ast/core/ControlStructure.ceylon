"A control structure statement, used to control normal execution flow.
 
 (An assertion failure is not considered as “normal” control flow;
 therefore, an [[Assertion]] is not a control structure.)
 
 Examples:
 
     if (exists elem = queue.take) { process(elem); }
     for (i in 1:12) { print(month(i)); }"
shared abstract class ControlStructure()
        of IfElse | While | ForFail
        extends Statement() {
}
