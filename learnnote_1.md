# SICP 1.xx瀛︿範绗旇 #



### by jim ###

--------------------------
杩欐槸SICP1銆

鏈锛process*, *procedure*, *self-evaluating*, *name*, *combinations*, *special form*,  
  
鍏抽敭瀛楋細primitives (numbers and built in procedures);
means of combination (ways of creating complex expressions);means of abstraction (a way of giving a name to something)


- 绗竴閮ㄥ垎

> - need a language for describing process:
> - 鎻忚堪process闇€瑕佺殑璇█鐗规€

>> + Vocabulary 
>> + Rules for writing compound expressions - syntax 璇硶
>> + Rules for assigning meaning to constructs - semantics 璇箟
>> + Rules for capturing process of evalution - procedures 杩囩▼

> - using procedures control complexity
> - 浣跨敤procedures鎺у埗澶嶆潅搴

>> + create a set of primitive elements in language - single data and procedures.
>> + create a set of rules for combining elenments of language.
>> + create a set of rules for abstructing elements - treat complex things as primitives.

> - management of complexity

>> + procedure and data abstraction
>> + conventionial interfaces & programming pradigms
>>> + manifest typing
>>> + streams
>>> + object oriented programming

>> + metalinguistic abstraction
>>> + layered languages for new problems
>>> + hardware/register languages
>>> + manipulation of programs compilation

> + evaluation rules 姹傚€艰鍒

>> + primitive: numberal string boolean evaluates to itself.
>> + name evaluates to the value bound that name in the enviroment.
>> + combination is evaluated as:

>>> + evaluate the subexpressions in any order.
>>> + apply the value of the operator subexpression to the values of the remaining subexpressions.
>>> + define and lambda special form are special:
1. a define associates the value of the second argument with the name given in the first argument.
2. a lambda expression evaluates to a procedure object that stores both the parameter list and procedure body.

> + substitution model: to apply a compound procedure to its argument:  
__evaluate the body with each formal parameter replaced by the corresponding argument__




--------------------------
1.26.scm 鍏充簬绠楁硶澶嶆潅搴︾殑鍒嗘瀽涓嶅お娓呮

