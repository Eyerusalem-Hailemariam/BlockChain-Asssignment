// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";
import "./Enemy.sol";

// Mage contract inherits from Hero with 50 initial health
contract Mage is Hero {
    constructor() Hero(50) {}

    // Override the attack function to invoke takeAttack with Spell type
    function attack(Enemy enemy) public override {
        super.attack(enemy);  // Calls the base attack function (decreases energy)
        enemy.takeAttack(AttackTypes.Spell);  // Applies the Mage-specific attack (Spell)
    }
}

// Warrior contract inherits from Hero with 200 initial health
contract Warrior is Hero {
    constructor() Hero(200) {}

    // Override the attack function to invoke takeAttack with Brawl type
    function attack(Enemy enemy) public override {
        super.attack(enemy);  // Calls the base attack function (decreases energy)
        enemy.takeAttack(AttackTypes.Brawl);  // Applies the Warrior-specific attack (Brawl)
    }
}
