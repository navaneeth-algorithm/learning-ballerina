
import ballerina/io;

public enum Colors {
    RED = "RED",
    BLUE = "BLUE",
    GREEN = "GREEN"
}

var isOdd = function(int n) returns boolean {
    return n % 2 != 0;
};

var isEven = function(int n) returns boolean {
    return n % 2 == 0;
};

type IntFilter function (int n) returns boolean;

type RGB Colors;

class MyClass {
    private int n;

    // default return type if not specified explcitly
    // is nil

    public function init(int n) returns error? {
        // _ = check io:fileReadString("main.bal");
        self.n = n;
    }

    public function matchVal(any n) {

        match n {

            10 => {
                io:println("=10");
            }

            100 => {
                io:println("=100");
            }

            "RED" => {
                io:println("RED");
            }

            "GREEN" => {
                io:println("GREEN");
            }

            "BLUE" => {
                io:println("BLUE");
            }

            _ => {
                io:println("Got....", n);
            }
        }
    }

    public function assignColor() returns Colors {
        RGB colorAssigned = RED;
        io:println(colorAssigned);
        return colorAssigned;

    }

    public function square() returns int {

        int sq = self.n * self.n;

        io:println(sq);
        return sq;
    }

    public function increament() {
        self.n = self.n + 1;
        io:println(self.n);
    }

    public function printN() {
        io:println(self.n);
    }

    #   Get the member integer
    #  + return - n
    public function getN() returns int {
        io:println(self.n);
        return self.n;
    }
    
    # Add square to a give 2 number
    # + a - integer value
    # + b - integer value
    # + return - return by adding square of n with given number
    public function addSquare(int a, int b) returns int{
        return self.square() + a + b;
    }
}

const MULTIPLIER = 2;

function onObjectOriented() returns error? {

    final int input = 4 * MULTIPLIER;

    MyClass msquare = check new (input);

    io:println("------My Class-------");

    _ = msquare.square();

    _ = msquare.assignColor();

    msquare.matchVal(RED);

    int[] arr = [4, 5, -34, 7, 45, -5, -23];


    io:println("--------FUTURE WAIT------");

    future<int> sq = start msquare.square();

    future<Colors> color = start msquare.assignColor();

    future<Colors> color2 = start  msquare.assignColor();

    

    int result = check wait sq;

    io:println(result);

    //also can be done by together

    record {string|error sq; string|error color;} futurewait = wait {sq:color2, color};

    io:println(check futurewait.color);

    io:println(check futurewait.sq);

    io:println("-------End");

    IntFilter odd = isOdd;
    IntFilter even = isEven;

    io:println(arr.filter(n => n > 0));
    io:println(arr.filter(even));
    io:println(odd(3));
    io:println(even(4));

    io:println(msquare.getN());

    io:println(msquare.addSquare(2,2));
}
