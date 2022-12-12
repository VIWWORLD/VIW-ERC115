pragma solidity ^0.8.0;

import "./fee/IFeeManager.sol";
import "./access/Ownable.sol";
import "./token/erc1155/ERC1155.sol";
import "./token/erc20/IERC20.sol";

contract VIWERC1155 is ERC1155, Ownable {

    mapping(uint256 => uint256) public tokenSupply;

    mapping(uint256 => address) public creators;

    mapping(uint256 => string) customUri;
    string public name;
    string public symbol;

    address public feeManager;

    constructor(
        string memory _name,
        string memory _symbol,
        address owner,
        address _feeManager
    ) ERC1155("") {
        name = _name;
        symbol = _symbol;
        feeManager = _feeManager;
        transferOwnership(owner);
    }

    function mintInERC20(
        address _to,
        uint256 _tokenId,
        uint256 _quantity,
        string memory _uri
    ) external onlyOwner {
        require(!_exists(_tokenId), "token _id already exists");
        // get fee treasury address
        address feeTreasuryAddress = IFeeManager(feeManager).getFeeTreasuryAddress();
        address feeContractAddress = IFeeManager(feeManager).getFeeContractAddress();
        uint256 feeMintAmount = IFeeManager(feeManager).getFeeERC1155Mint();
        // transfer erc20 to treasuryFeeAddress
        IERC20(feeContractAddress).transferFrom(address(msg.sender), feeTreasuryAddress, feeMintAmount);
        creators[_tokenId] = _to;
        if (bytes(_uri).length > 0) {
            customUri[_tokenId] = _uri;
            emit URI(_uri, _tokenId);
        }
        tokenSupply[_tokenId] = _quantity;
        _mint(_to, _tokenId, _quantity, "");
    }

    function mintInETH(
        address _to,
        uint256 _tokenId,
        uint256 _quantity,
        string memory _uri
    ) external payable onlyOwner {
        require(!_exists(_tokenId), "token _id already exists");
        // get fee treasury address
        address feeTreasuryAddress = IFeeManager(feeManager).getFeeTreasuryAddress();
        uint256 feeMintEthAmount = IFeeManager(feeManager).getFeeERC1155MintInETH();
        // check erc20 fee amount in balance
        require(address(msg.sender).balance >= feeMintEthAmount, "Lack Of ETH Fee Amount");
        // transfer eth to treasuryFeeAddress
        payable(feeTreasuryAddress).transfer(feeMintEthAmount);

        creators[_tokenId] = _to;
        if (bytes(_uri).length > 0) {
            customUri[_tokenId] = _uri;
            emit URI(_uri, _tokenId);
        }
        tokenSupply[_tokenId] = _quantity;
        _mint(_to, _tokenId, _quantity, "");
    }



    function uri(
        uint256 _id
    ) override public view returns (string memory) {
        require(_exists(_id), "MultiCollection#uri: NONEXISTENT_TOKEN");
        bytes memory customUriBytes = bytes(customUri[_id]);
        return customUri[_id];
    }

    function _exists(
        uint256 _id
    ) internal view returns (bool) {
        return creators[_id] != address(0);
    }


}
