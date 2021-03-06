// SPDX-License-Identifier: MIT
// My implementation of https://www.youtube.com/watch?v=4w_bMkoo2uw

pragma solidity 0.8.7;

contract SendingEther
{
    //Accept Ether when an instance is deployed
    constructor () payable {}

    //Accept ether when msg.data is empty
    receive () external payable {}

    function TransferEther(address payable to, uint etherToSend) external
    {
        //Throws exception if transfer() fails and refunds all the gas
        to.transfer(etherToSend);
    }

    function SendEther(address payable to, uint etherToSend) external
    {
        //Using require() to raise an exception and refund gas if send() fails
        require(to.send(etherToSend), "SendEther failed");
    }
}

contract ReceivingEther
{
    event Msg(string message, uint balance);
    
    receive() external payable {}

    function ShowBalance() external
    {
        // Save the current balance on the blockchain
        emit Msg("Current balance", address(this).balance);
    }
}
