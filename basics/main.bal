import ballerina/io;

function validation(boolean value) {
    if (value) {
        io:println("Valid success");
    }
    else {
        io:println("Not success");
    }
}

function stringOperation(string s) {
    //Substring operation
    string result = s.substring(0, s.length() == 0 ? 0 : s.length() - 1);
    io:println("--------Begin---------");
    io:println("Actual string: ", s);
    io:println("substring: ", result);
    io:println("Length of string: ", s.length());
    io:println("----------End------");
}

function arrayOperation() {
    //Array decalration & initialisation
    int[] arrayNm = [2, 3, 4, 5, 4];

    //equal arrray arrayNm
    int[] arrayPm = [2, 3, 4, 5, 4];

    //shuffle array arrayNm
    int[] arrayCm = [2, 4, 3, 5, 4];

    //replace one arrayNm elemnt with new one
    int[] arrayKm = [2, 10, 4, 5, 4];

    //assign one array to another
    int[] arrayGm = arrayNm;

    //Accessing array index
    int indexNm = arrayNm[2];

    io:println("Array content are: ");

    //Printing array elements
    foreach var arrayItem in arrayNm {
        io:print("arrayNm: ", arrayItem, " ");
    }

    io:println("Array index 2: ", indexNm);

    foreach var item in arrayPm {
        io:print(item, " ");
    }
    io:println("Are array equal? arrayNm == arrayPm :", arrayNm == arrayPm);

    foreach var item in arrayCm {
        io:print(item, " ");
    }
    io:println("Are array equal?arrayNm==arrayCm :", arrayNm == arrayCm);

    foreach var item in arrayKm {
        io:print(item, " ");
    }
    io:println("Are array equal?arrayNm==arrayKm :", arrayNm == arrayKm);

    foreach var item in arrayGm {
        io:print(item, " ");
    }
    io:println("Are array equal?arrayNm==arrayGm :", arrayNm == arrayGm);

    //change content of Gm & see wether its still valid
    arrayGm[0] = -1;
    //modified array
    foreach var item in arrayGm {
        io:print(item, " ");
    }

    io:println("");
    //Nm also changed
    io:println("Modified arrayNm");
    foreach var item in arrayNm {
        io:print(item, " ");
    }

    io:println("Are array equal after modifying Gm?arrayNm==arrayGm :", arrayNm == arrayGm);

    io:println("Cloned the array arrayNm to newArrayNm");

    //cloning
    int[] newArrayNm = arrayNm.clone();

    //check equality
    io:println("newArrayNm and ArrayNm are equal?arrayNm==newArrayNm", arrayNm == newArrayNm);

    //change newArrayNm
    newArrayNm[0] = 100;
    io:println("Are array same afater modifying newArrayNM?arrayNm==newArrayNm ", arrayNm == newArrayNm);

}

function onMap() {
    map<int> settlement = {"Nomad": 10, "Maldives": 40, "Elves": 50};

    io:println("Print Values...");
    //printing map values
    foreach var item in settlement {
        io:print(item, " ");
    }

    io:println("Print Keys....");
    //printing key values
    foreach var item in settlement.keys() {
        io:print(item, " ");
    }

    io:println("Print Key:Value pairs..");
    //printing key value pair
    foreach var item in settlement.keys() {
        io:println("{" + item + ":" + settlement[item].toString() + "}");
    }

    io:println("Non available key return nil type");
    io:println(settlement["banyan"] == () ? "Nil" : "Available");

    io:println(" ");
}

function onLoop() {
    foreach var item in 0 ..< 10 {
        io:print(item, " ");
    } //print element from 0 to 9
    io:println("");
    io:println("Loop over string? Hello World");
    string greet = "Hello World";

    foreach var item in greet {
        io:print(item, " ");
    }

    io:println("");
    //while loop
    int count = 10;
    while count > 0 {
        io:print(count, " ");
        count = count - 1;
    }

}

//Defining Navaeeth in type
type Navaneeth int[];

type Indresh map<string>[];

function onUserType() {
    io:println("User Defined Data type");
    Navaneeth ab = [10, 20, 40];
    io:println(ab);

    Indresh bc = [
        {x: "4"},
        {y: "6"}
    ];

    io:println(bc);
}

type Coord record {
    int x;
    int y;
    string name;
};

function onRecord() {
    //In Record we can define variable for key 
    //ie.what your keys are
    record {int x; int y;} r = {x: 0, y: 0};
    record {||} e = {};

    r.x = 10;
    r.y = 11;
    io:println(r);
    io:println(e);

    //can also be declared using user 
    //defined data type
    Coord ord = {x: 10, y: 11, name: "temp"};
    io:println("Co ordinate using type & record..");
    io:println(ord);
}

//type user defined
type BookContact record {string fullName; string phoneNumber;}[];

type Mutable int|string|float|boolean|BookContact;

function getName(Mutable name) returns string {

    //is operator used to check type & return valid type
    if name is string {
        return name;
    }
    else if name is int {
        return name.toString();
    }
    else if name is float {
        return name.toString();
    }
    else if name is boolean {
        return name.toString();
    }
    else {
        return name[0].fullName + " " + name[0].phoneNumber + "\n" + name[1].fullName + " " + name[1].phoneNumber;
    }
}

function onUnion() {
    //here Mutable user defined data type can be used as
    // int,float,string,boolean
    Mutable uInt = 9;
    Mutable uFloat = 30.0;
    Mutable uString = "Hello World";
    Mutable uBoolean = false;
    Mutable inbenneRecords = [
        {fullName: "Navaneeth", phoneNumber: "+918762298258"},
        {fullName: "Home", phoneNumber: "08202531000"}
    ];

    io:println(uInt);
    io:println(uFloat);
    io:println(uString);
    io:println(uBoolean);
    io:println(inbenneRecords);

    string rep = getName(inbenneRecords);
    io:println("Representation: " + rep);
}

//subtype error
type XErr distinct error;

type YErr distinct error;

type Err XErr|YErr;

function onError(int a, int b) returns error|int {

    if (b == 0) {
        //panic used to terminate abnorml error
        panic error("division by error");
    }
    else if (a == 0) {

    }
    else if (b < 0 || a < 0) {
        return error("Negative value");
    }

    int c = a / b;
    string code = check string:fromCodePointInt(a);

    io:println("Its code point is ", code);

    int val = a / b;

    Err whoops = val < 10 ? error XErr("Got XErr!!!") : error YErr("Got YErr!!!");

    if whoops is XErr {
        io:println("Whoops!! is XErr");
    }
    else if whoops is YErr {
        io:println("Whoops!! is YErr");
    }

    //io:println(c);
    return c;

}

type RecordType record {int x;int y;};
function onAnyType() {

    any mutable = 10;
    //any type can be used to check type of value held;
    if(mutable is int){
        io:println("Itts Int!!!");
    }

    mutable = true;
    if(mutable is boolean){
        io:println("Its!! boolean");
    }

    mutable = 10;
    //any type can be used to convert to respective type;
    float b = <float>mutable;
    io:println("Float Converted!!: ",b);

    string c = mutable.toString();
    io:println("To String!!! ", c);

    //storing array
    mutable = [1,2,3,4];
    io:println("Array storing..!!! ",mutable);

    //storing map
    mutable = {"name":"navaneeth","age":23};
    io:println("Map storing!!! ",mutable);

    RecordType sRecord = {x:10,y:5};
    //storing user defined record type
    mutable = sRecord;
    io:println("Stroing user defined type!!! ",mutable);



}

function onIgnoreReturn(int a) returns int|error{
    if a<0{
        return error("Got -ve value!!!");
    }

    return a*a;
}

public function main() {
    int? optional = ();

    string aString = "hello";
    string bString = "world";
    string cString = "\u{1F600}" + aString + bString;

    io:println("C string here is " + cString);

    io:println("There!! you go new function");

    //elvis operator
    int validInteger = optional ?: 0;
    io:println("Optional variable ", validInteger);

    //validation(optional == () ? true : false);

    //stringOperation("Hello World");

    //stringOperation("H");

    //arrayOperation();

    //onLoop();

    //onMap();

    // onUserType();
    //onRecord();

    //onUnion();
    //io:println("Got error|int;----- ",onError(100,2));
    //onAnyType();



    //checkpanic used to terminate program (panic) if it returns error
    // else _ to ignore return value 
    _ = checkpanic onIgnoreReturn(5);
}
