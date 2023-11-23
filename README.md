# Contract Definition:


```dotnetcli


contract Counter is ERC2771Context {

```

Defines the Counter contract, which inherits from the ERC2771Context contract.

## State Variables:

```dotnetcli

uint256 public number;
address public lastUser;
address private _trustedForwarder;
```

    
- number: Public variable to store an unsigned integer, representing the current count.
    
- lastUser: Public variable to store the address of the last user who interacted with the contract.
- _trustedForwarder: Private variable to store the trusted forwarder address.
  
## Event

```dotnetcli
event updateCount(uint256 newCount);

```
Declares an event named updateCount that is emitted when the number state variable is updated. This is useful for tracking changes to the count.

## Constructor

```dotnetcli

constructor(address _t) ERC2771Context(_t) {
    _trustedForwarder = _t;
}
```

Constructor that initializes the contract with the trusted forwarder address passed as an argument. It calls the constructor of the parent ERC2771Context contract with the same argument.

## Functions

- `setNumber(uint256 newNumber)`: Sets the number state variable to the specified value and updates the lastUser variable.

- `increment()`: Increments the number by 1, emits an updateCount event, and updates the lastUser.
  
- `decrement()`: Decrements the number by 1, emits an updateCount event, and updates the lastUser.

- `getNumber()`: Returns the current value of the number variable.
  
- `getLastUser()`: Returns the address of the last user who interacted with the contract.


## Conclusion

This contract provides basic functionality for counting, allowing users to increment, decrement, and retrieve the current count. The use of ERC2771Context suggests that the contract supports meta transactions, enabling users to interact with the contract without directly paying gas fees on the Ethereum network.




## Authors
[@metacraftersio]()

[Oche Esther](https://twitter.com/Estheroche1)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.