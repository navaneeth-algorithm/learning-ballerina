import ballerina/io as input;

function add(int a, float b) returns int{

    int c = a+<int>b;
    return c;
}


public function main() {
    
    string greet = "hellow world";
    int c=0;

    //defined & print the variable name
    input:println(greet);
    int ans = add(3,5.6);
    input:println(ans);
    input:println(c);
}
