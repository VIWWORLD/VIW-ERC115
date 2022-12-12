pragma solidity ^0.8.0;

import "./IFeeManager.sol";
import "../access/Ownable.sol";

contract FeeManager is IFeeManager, Ownable {

    address public feeTreasuryAddress;
    address public feeContractAddress;

    uint256 public feeERC721CreateAmount;
    uint256 public feeERC1155CreateAmount;
    uint256 public feeERC721MintAmount;
    uint256 public feeERC1155MintAmount;

    uint256 public feeERC721CreateAmountETH;
    uint256 public feeERC1155CreateAmountETH;
    uint256 public feeERC721MintAmountETH;
    uint256 public feeERC1155MintAmountETH;

    constructor (
        address _feeTreasuryAddress, address _feeContractAddress,
        uint256 _feeERC721CreateAmount, uint256 _feeERC1155CreateAmount, uint256 _feeERC721MintAmount, uint256 _feeERC1155MintAmount,
        uint256 _feeERC721CreateAmountETH, uint256 _feeERC1155CreateAmountETH, uint256 _feeERC721MintAmountETH, uint256 _feeERC1155MintAmountETH) {
        feeTreasuryAddress = _feeTreasuryAddress;
        feeContractAddress = _feeContractAddress;

        feeERC721CreateAmount = _feeERC721CreateAmount;
        feeERC1155CreateAmount = _feeERC1155CreateAmount;
        feeERC721MintAmount = _feeERC721MintAmount;
        feeERC1155MintAmount = _feeERC1155MintAmount;

        feeERC721CreateAmountETH = _feeERC721CreateAmountETH;
        feeERC1155CreateAmountETH = _feeERC1155CreateAmountETH;
        feeERC721MintAmountETH = _feeERC721MintAmountETH;
        feeERC1155MintAmountETH = _feeERC1155MintAmountETH;
    }


    function changeFeeTreasuryAddress(address _feeTreasuryAddress) external onlyOwner {
        feeTreasuryAddress = _feeTreasuryAddress;
    }

    function changeFeeContractAddress(address _feeContractAddress) external onlyOwner {
        feeContractAddress = _feeContractAddress;
    }

    // ERC20
    function changeFeeERC721Create(uint256 _feeERC721CreateAmount) external onlyOwner {
        feeERC721CreateAmount = _feeERC721CreateAmount;
    }

    function changeFeeERC1155Create(uint256 _feeERC1155CreateAmount) external onlyOwner {
        feeERC1155CreateAmount = _feeERC1155CreateAmount;
    }

    function changeFeeERC721Mint(uint256 _feeERC721MintAmount) external onlyOwner {
        feeERC721MintAmount = _feeERC721MintAmount;
    }

    function changeFeeERC1155Mint(uint256 _feeERC1155MintAmount) external onlyOwner {
        feeERC1155MintAmount = _feeERC1155MintAmount;
    }

    // ETH
    function changeFeeERC721CreateInETH(uint256 _feeERC721CreateAmountETH) external onlyOwner {
        feeERC721CreateAmountETH = _feeERC721CreateAmountETH;
    }

    function changeFeeERC1155CreateInETH(uint256 _feeERC1155CreateAmountETH) external onlyOwner {
        feeERC1155CreateAmountETH = _feeERC1155CreateAmountETH;
    }

    function changeFeeERC721MintInETH(uint256 _feeERC721MintAmountETH) external onlyOwner {
        feeERC721MintAmountETH = _feeERC721MintAmountETH;
    }

    function changeFeeERC1155MintInETH(uint256 _feeERC1155MintAmountETH) external onlyOwner {
        feeERC1155MintAmountETH = _feeERC1155MintAmountETH;
    }



    function getFeeTreasuryAddress() public view override returns (address) {
        return feeTreasuryAddress;
    }

    function getFeeContractAddress() public view override returns (address) {
        return feeContractAddress;
    }

    // ERC20
    function getFeeERC721Create() public view override returns (uint256) {
        return feeERC721CreateAmount;
    }

    function getFeeERC1155Create() public view override returns (uint256) {
        return feeERC1155CreateAmount;
    }

    function getFeeERC721Mint() public view override returns (uint256) {
        return feeERC721MintAmount;
    }

    function getFeeERC1155Mint() public view override returns (uint256) {
        return feeERC1155MintAmount;
    }

    // ETH
    function getFeeERC721CreateInETH() public view override returns (uint256) {
        return feeERC721CreateAmountETH;
    }

    function getFeeERC1155CreateInETH() public view override returns (uint256) {
        return feeERC1155CreateAmountETH;
    }

    function getFeeERC721MintInETH() public view override returns (uint256) {
        return feeERC721MintAmountETH;
    }

    function getFeeERC1155MintInETH() public view override returns (uint256) {
        return feeERC1155MintAmountETH;
    }



}
