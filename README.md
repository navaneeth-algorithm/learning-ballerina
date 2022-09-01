# Ballerina

### Gives ballerina version

```
bal version

Ballerina 2201.1.1 (Swan Lake Update 1)
Language specification 2022R2
Update Tool 1.3.9
```

### Create package with default mode

`hello_world` is name of <mark style="background-color: gray;color:white">package</mark>
```
bal new hello_world
```
### File structure
```
hello_world/
      Ballerina.toml
      main.bal
```
`.toml` file describes meta data of package

`.bal` is where u write **code**

### Run Code
create executable & run `.jar` target file
```
bal run
```

### Build Code
- Build the code to `.jar` file
- then run `bal run target/run/file_name.jar`
```
bal build
```
## Basics

```
import ballerina/io
```
- ballerina is organisation name
- io is module name
- can ovveride as `import ballerina/io as input`
- follows / & . notation. `org/x.y.z` heirarchical module
- `z:f` represent function defined witihin `org/x.y.z` module



### Variable types

```java
string name = "Hello world";
int a = 10;
int b = 0xFFFF;
boolean trueValue = true;
boolean falseValue = false;
float d = 0.43;
int n = trueValue?1:0;
```
- Implicit conversion is not valid here
- convert by `<variable_type>` notation
    ```
    int a=10;
    float b = 4.5;
    int c = a + <int>b;
    ```
- implicit conversion between `int` & `bool` not supported
- `Nil` or `null` type represented by `()`
    ```
    int? a = ();
    ```
- `ternery` operator `a==()?0:b`
- `elvis` operator `x?:0` which returns `x` if not `Nil` else return `0` 
- `string` concatenation
    ```java
    string a ="hello";
    string b = "world";
    string c = "\u{1F600}"+a+b;
    ```
- `string` lettter can be accessed by `[i]` index operator
- `string` is **immutable** type



### Function
```
function function_name(variable_type arg1,variable_type arg2...) returns return_type{

}
```
- `function` is **keyword** for creating function
- `function_name` is name of the function
- `variable_type` is type of variable, can be `int`, `float`, `string`, `bool` ..
- `returns` is keyword for retrurning the variable
- `return_type` is the supported ballerina variable types



### Arrays

```java
int []a = [1,3,2,2]
int n = a[2]
```
- `Array` are mutable
- `!=` and `==` on 2 array compares on members equality rather than memeory equality.ie. `deep comparision` happens rather than `shallow comparision`
- ```java
    int [] a = [1,2,3,4]
    int [] b = [1,2,3,4]
    int [] c = b.clone()
    a==b true
    c==b true //members are sames in both c & b
    b[0]= -1 //value of a also gets changed at index 0 to -1
    a==b true

    c==b false //members are different in both and c
  ```


  ### For Each

  - Iterate over array of elements
  - ```java
        foreach var item in items{
            io:println(item)
        }//iterate over items and rray prints items array

        //range
        foreach num in 0 ..<10{
            io:println(num);
        }//prints num from 0 to 9
    ```

### byte data
- `byte` subtype of integer
- can be used to store binary data
- ```java
    byte [] data = base64 `yPHaytRgJPg+QjjylUHakEwz1fWPx/wXCW41JSmqYW8=`; //binary data representation
    byte d = 0xFF;
    ```
 - `byte` type represents a number between `0` and `0xFF`



### Maps
- `map` is **key value** pair;
- `map` are mutable
- Represented by `{key:value}`
- `key` should be unique.
- if `key` not present, it wil return `Nil represent ()` 

### Type defination

- `type` keyword used to define used data type
- Declare in module level rather than unction  level;


### Record
- `record` is keyword used to declare record
- A `record` is a collection of fields of a specific type. With record types, you have control over what your **keys** are
- `record` are mutable.

- if varaible name & the key reside in the record name are same , we can ignore key while assigning.
Eg:
   ```
   int x=10;int y=11;
   record {int x;int y;} one = {x:x,y:y};

   //can also be written as

   record {int x;int y;} two = {x,y};
   ```

- check [code](basics/main.bal#L170) 



### Unions
- variable can be declared as multi type;
- `|` symbol used to declare multi variable type
- check  this for more [code](basics/main.bal#L212) 


### Error Handling
- keywords `error`, `check`,`panic`, `distinct`
- `error` used to return error if there is any
- `panic` used to terminate program if there is abnormal error and has an associated error value.
- `check` is used to evaluate expression, if expression contains error then it returns error from called function else continue with program
- `distinct` used with `type` to define unique error.
- [code](basics/main.bal#L234)


### `any` type
- can store any type of value
- [code](basics/main.bal#L280)


### Ignoring error and Return value

- Function which returns value or error must be assigned otherwise it throws error.
- returned `value` can by bypassed by assigning to `_` symbol;

- if `error` type is returned , it has to be explicitly handled otherwise we can use `checkpanic` which `panic` on error rather than returning.

- [code](basics/main.bal#L318)


### Covariance
- [check URL](https://ballerina.io/learn/language-basics/#covariance)





### Class & Object

- `class` keyword used to create class

- `init` method used as constructor

- `self` is used to reference current Object

- `init` method can return type which should be union of `error` & `nil`

- if `init()` calls normally , then constructor object is returned else new expression returns error value

- The return type of the `init()` method is `nil` if a return type is not explicitly specified. It also means that the init method will never return an error.

- obj identity can be found by `!==` & `===` operator. since objject resides memory, it used to check identity of memory of object


### `const` and `final`

-  `const` variables are compile time variable, whose value cannot be changed

- `final` are run time variable , once initialised then its value cannot be changed.

-  `const` declaration allowed at module level


### Enumeration

- `enum` keyword used to create list of constants

### `match`

- `match` act as switch statement

- check [code](basics/objectOriented.bal#L23)

### Functional Programming
- check documentation


### Asynchronous Programming

- `start`,`wait`,`future` are the keywords used in asynchronous programming

- `start` used in function or method to indicate it is asynchronous

- `wait` used to wait for the asynchronous function or method


- `future<T>` returns `T|error` after `wait`

- waiting on the same **`future`** returns error

- check [code](basics/objectOriented.bal#L112)



### Documentation

- Markdown documentation

- starts with `#`
- `+` variable_name `-`
- `+` return `-` 
- check [code](basics/objectOriented.bal#L98) 


### Annotation
- check documentation
