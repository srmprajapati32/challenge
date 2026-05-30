// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {

    struct Product {
        uint256 id;
        string serialNumber;
        string name;
        address manufacturer;
        bool exists;
    }

    uint256 public productCount;

    mapping(uint256 => Product) public products;

    mapping(string => bool) private serialExists;

    event ProductRegistered(
        uint256 id,
        string serial,
        address manufacturer
    );

    modifier onlyNewSerial(string memory serial) {
        require(!serialExists[serial], "Serial already registered");
        _;
    }

    function registerProduct(
        string memory serial,
        string memory name
    )
        public
        onlyNewSerial(serial)
    {
        productCount++;

        products[productCount] = Product(
            productCount,
            serial,
            name,
            msg.sender,
            true
        );

        serialExists[serial] = true;

        emit ProductRegistered(
            productCount,
            serial,
            msg.sender
        );
    }

    function getProduct(uint256 id)
        public
        view
        returns (
            uint256,
            string memory,
            string memory,
            address,
            bool
        )
    {
        Product memory p = products[id];

        return (
            p.id,
            p.serialNumber,
            p.name,
            p.manufacturer,
            p.exists
        );
    }
}