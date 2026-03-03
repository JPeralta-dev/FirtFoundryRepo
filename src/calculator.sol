//SPDX-License-1dentifier: LGPL-3.0-on1Y
//SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract calculator {
    uint256 public resultado;

    constructor(uint256 restultado_) {
        resultado = restultado_;
    }

    // events

    event Addition(uint256 num1_, uint256 num2_, uint256 resultado_);

    event Substraction(uint256 num1_, uint256 num2_, uint256 resultado_);

    event Multiplier(uint256 num1_, uint256 num2_, uint256 resultado_);

    event Division(uint256 num1_, uint256 num2_, uint256 resultado_);

    function addition(
        uint256 num1_,
        uint256 num2_
    ) external returns (uint256 resultado_) {
        resultado_ = num1_ + num2_;
        resultado = resultado_;
        emit Addition(num1_, num2_, resultado_);
    }

    function substraction(
        uint256 num1_,
        uint256 num2_
    ) external returns (uint256 resultado_) {
        resultado_ = num1_ - num2_;
        resultado = resultado_;
        emit Substraction(num1_, num2_, resultado_);
    }

    function multiplier(
        uint256 num1_,
        uint256 num2_
    ) external returns (uint256 resultado_) {
        resultado_ = num1_ * num2_;
        resultado = resultado_;
        emit Substraction(num1_, num2_, resultado_);
    }

    function division(
        uint256 num1_,
        uint256 num2_
    ) external returns (uint256 resultado_) {
        resultado_ = num1_ / num2_;
        resultado = resultado_;
        emit Division(num1_, num2_, resultado_);
    }
}
