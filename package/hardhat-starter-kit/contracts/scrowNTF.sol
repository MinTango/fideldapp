pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";



contract Staker {

  uint256 public deadline = block.timestamp + 72 hours;
  mapping(address => bool) public winnerAddress;
  address _MyNFTAdress;

  constructor(address _NFTwinner) public {
    _MyNFTAdress = _NFTwinner;
  }

 modifier _ownerOnly(){
    require(msg.sender == owner);
 }

 // deposit NFT  
 function depositNFT(address _NFTAddress, uint256 _TokenID) public
 {
    nftAddress = _NFTAddress;
    tokenID = _TokenID;
    ERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenID);
    winnerAddress[msg.sender] = true;
    //projectState = ProjectState.nftDeposited;
  }

  // After some `deadline` allow anyone to call an `execute()` function
  //  It should either call `exampleExternalContract.complete{value: address(this).balance}()` to send all the value
  function execute(address _NFTaddress) owner public {
    require(block.timestamp >= deadline, 'Deadline not reached.');
    require(ERC721(_NFTaddress).balanceOf(msg.sender) > 0, "There is not NFT deposit");
    
    //check rarity of NFT collected 
    //Mint NFT and send to the winner
    ERC721(_MyNFTAdress).safeMint(winnerAddress[0]);
  }

  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
  function timeLeft() public view returns (uint256) {
    if(block.timestamp >= deadline)
      return 0;
    
    return deadline - block.timestamp;
  } 

}






