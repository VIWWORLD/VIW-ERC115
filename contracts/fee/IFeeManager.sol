pragma solidity ^0.8.0;

interface IFeeManager {
    function getFeeTreasuryAddress() external view returns (address);
    function getFeeContractAddress() external view returns (address);

    // ERC20 VIW
    function getFeeERC721Create() external view returns (uint256);
    function getFeeERC1155Create() external view returns (uint256);
    function getFeeERC721Mint() external view returns (uint256);
    function getFeeERC1155Mint() external view returns (uint256);

    // ERC20 ETH
    function getFeeERC721CreateInETH() external view returns (uint256);
    function getFeeERC1155CreateInETH() external view returns (uint256);
    function getFeeERC721MintInETH() external view returns (uint256);
    function getFeeERC1155MintInETH() external view returns (uint256);
}
