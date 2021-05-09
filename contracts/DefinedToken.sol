// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";

/**
 * @title DefinedToken
 * DefinedToken - an OpenSea-tradable contract with owner-defined token IDs that
 * also allows setting of the baseTokenURI.
 */
contract DefinedToken is ERC721Tradable {
    string private _baseTokenURI;

    constructor(string memory name, string memory symbol, string baseTokenURI, address proxyRegistryAddress)
        ERC721Tradable(name, symbol, proxyRegistryAddress)
    {
        setBaseTokenURI(baseTokenURI);
    }

    /*
     * @dev Mints `tokenId` and safely transfers it to `to`.
     */
    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId, "");
    }

    function baseTokenURI() override public view returns (string memory) {
        return _baseTokenURI;
    }

    /*
     * @dev Sets the value returned by baseTokenURI().
    */
    function setBaseTokenURI(string baseTokenURI) public onlyOwner {
        _baseTokenURI = baseTokenURI;
    }
}
