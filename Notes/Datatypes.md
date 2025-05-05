1. Booleans
Storage variable: Declared inside a contract; persists on-chain.

Default value: false for bool.

Example:

solidity
Copy
Edit
contract Contract {
    bool public a = true;
    bool public b = false;
}
2. Unsigned Integers (uint)
Definition: Integers with no negative sign.

Example sizes: uint8 (0–255), uint16 (0–65,535), uint256 (default).

Overflow: Older Solidity versions didn’t prevent overflow. Newer versions do.

Example:

solidity
Copy
Edit
contract Contract {
    uint8 public a = 100;
    uint16 public b = 300;
    uint256 public sum = a + b;
}
3. Signed Integers (int)
Definition: Includes negative and positive integers.

Example ranges:

int8: -128 to 127

int256: full signed 256-bit int

Example:

solidity
Copy
Edit
contract Contract {
    int8 public a = 20;
    int8 public b = -15;
    int16 public difference = a - b; // = 35
}
4. String Literals
Types:

string: Dynamically-sized, human-readable.

bytes32: Fixed-size (max 32 bytes), more efficient for short text.

UTF-8 Encoding: Affects storage size.

Example:

solidity
Copy
Edit
contract Contract {
    bytes32 public msg1 = "Hello World";
    string public msg2 = "This string is definitely over 32 bytes long!";
}
5. Enums
Purpose: Improves code readability and safety.

Example:

solidity
Copy
Edit
contract Contract {
    enum Foods { Apple, Banana, Carrot, Donut }

    Foods public food1 = Foods.Apple;
    Foods public food2 = Foods.Banana;
    Foods public food3 = Foods.Carrot;
    Foods public food4 = Foods.Donut;
}
