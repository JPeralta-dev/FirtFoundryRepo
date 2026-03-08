//SPDX-License-1dentifier: LGPL-3.0-on1Y
//SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import "../src/calculator.sol";
import "forge-std/Test.sol";

contract calculatorTest is Test {
    calculator calculadora; // instancia del otro smart contracto
    uint256 public resultado = 100;
    address public admin = vm.addr(1); // esto ahce que genere una wallet que poderemos "manejar" desde nuestro wallet es decir
    // njosotros somos la EOA a Y el la b en eesta caso tendremos acceso por eso esta hecha para hcaer pruebas
    address public RandomUser = vm.addr(2);
    function setUp() public {
        calculadora = new calculator(resultado, admin);
    } // se ejectua siempre antes de cualquier test

    // unit testing

    function testCheckResultado() public view {
        uint256 resultado_ = calculadora.resultado();
        assert(resultado_ == resultado);
    }

    function testAdition() public {
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculadora.addition(firtNumber_, secondNumber_);
        assert(resultado_ == firtNumber_ + secondNumber_);
    }

    function testSubtration() public {
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculadora.substraction(
            firtNumber_,
            secondNumber_
        );
        assert(resultado_ == firtNumber_ - secondNumber_);
    }

    function testMultiplier() public {
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculadora.multiplier(firtNumber_, secondNumber_);
        assert(resultado_ == firtNumber_ * secondNumber_);
    }

    function testCanNotMultiply2LargeNumbers() public {
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 115792089237316195423570985008687907853269984665640564039457584007913129639934;

        vm.expectRevert();
        calculadora.multiplier(firtNumber_, secondNumber_);
    }

    function testIfNotAdminCallDivisionRevert() public {
        vm.startPrank(RandomUser); // IMPERSONAL UNA WALLET
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;
        vm.expectRevert();
        // dentro de esa linea es como si estuviera llamando ese usuario
        calculadora.division(firtNumber_, secondNumber_);
        vm.stopPrank();
    }

    function testAdminCanCallDivisionCorrectly() public {
        vm.startPrank(admin); // IMPERSONAL UNA WALLET
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;

        // dentro de esa linea es como si estuviera llamando ese usuario
        calculadora.division(firtNumber_, secondNumber_);
        vm.stopPrank();
    }

    function testDivision() public {
        vm.startPrank(admin);
        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 5;

        // dentro de esa linea es como si estuviera llamando ese usuario
        uint256 result_ = calculadora.division(firtNumber_, secondNumber_);

        assert(result_ == firtNumber_ / secondNumber_);
        vm.stopPrank();
    }

    function testDivisionZero() public {
        vm.startPrank(admin);

        uint256 firtNumber_ = 5;
        uint256 secondNumber_ = 0;

        vm.expectRevert();
        // dentro de esa linea es como si estuviera llamando ese usuario
        calculadora.division(firtNumber_, secondNumber_);

        vm.stopPrank();
    }
    // Unit testing -> given inputs
    //Fuzzing testing -> nivel alto, puesto para senior y tenemos randoms inputs
    /*
    Tenemos un test en que fondry llama en el foundry.toml unos parametros poara hacer x llamadas puede urilizar varias numeros de pruebas 
    randoms para que pruebes
    */

    function testFuzzingDivision(
        uint256 firtNumber_,
        uint256 secondNumber_
    ) public {
        vm.assume(secondNumber_ != 0);
        vm.startPrank(admin);

        // dentro de esa linea es como si estuviera llamando ese usuario
        uint256 result_ = calculadora.division(firtNumber_, secondNumber_);

        assert(result_ == firtNumber_ / secondNumber_);
        vm.stopPrank();
    }
}
