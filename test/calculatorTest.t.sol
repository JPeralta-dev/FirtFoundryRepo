//SPDX-License-1dentifier: LGPL-3.0-on1Y
//SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import "../src/calculator.sol";
import "forge-std/Test.sol";

contract calculatorTest is Test {
    calculator calculadora; // instancia del otro smart contracto
    uint256 public resultado = 100;
    address public admin = vm.addr(1);

    function setUp() public {
        calculadora = new calculator(resultado, admin);
    } // se ejectua siempre antes de cualquier test
}
