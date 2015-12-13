"""An inline getter argument definition.
   
   Examples (multi-line):
   
       String val {
           StringBuilder sb = StringBuilder();
           for (person in people) {
               sb.append("``person.firstName`` ``person.lastName``");
               if (exists age = person.age) {
                   sb.append(", ``age`` year`` age != 1 then "s" else "" ``");
               }
               sb.appendNewline();
           }
           return sb.string;
       }
   
       value elements = people.collect(Person.age);"""
shared class ValueArgument(name, type, definition)
        extends InlineDefinitionArgument() {
    
    "The name of the value,
     as well as of the parameter it’s assigned to."
    shared actual LIdentifier name;
    "The type of the value.
     
     This can be:
     - a proper [[Type]],
     - a [[’`value`’ modifier|ValueModifier]] to indicate type inference, or
     - a [[’`dynamic`’ modifier|DynamicModifier]] to indicate the absence of a type."
    shared Type|ValueModifier|DynamicModifier type;
    "The definition of the value.
     
     Note that named arguments are always evaluated eagerly at call-site,
     even if the definition is a [[LazySpecifier]] or a [[Block]]."
    shared AnySpecifier|Block definition;
    
    shared actual [Type|ValueModifier|DynamicModifier, LIdentifier, AnySpecifier|Block] children = [type, name, definition];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueArgument(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitValueArgument(this);

    shared actual Boolean equals(Object that) {
        if (is ValueArgument that) {
            return name == that.name && type == that.type && definition == that.definition;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * definition.hash));
    
    shared ValueArgument copy(LIdentifier name = this.name, Type|ValueModifier|DynamicModifier type = this.type, AnySpecifier|Block definition = this.definition) {
        value ret = ValueArgument(name, type, definition);
        copyExtraInfoTo(ret);
        return ret;
    }
}
