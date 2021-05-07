pragma solidity ^0.6.0;
//showing you pretty adv stuff! this is how to use Interfaces to interact with UniSWap
// im calling the UniswapV2Factory smart contract with the interface command! remeber the interface lesson! we use interface to get USE another tool in simple terms!
//this UniswapV2Factory will give us the contract address that keeps track of how much dai and weth are in locked into Uniswap, now we can get token reserves below
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}
//I knw what your thinkg another interface! lol but we gotta get some more info from uniswap ! they help me alot here is link to thier resources! https://uniswap.org/docs/v2/smart-contracts/pair/#getreserves
interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniStuff {
    address private factory = 0x60f0B0F1Aa9ecd218D9003fD516343629DCd2556;
    address private dai = 0x60f0B0F1Aa9ecd218D9003fD516343629DCd2556;
    address private weth = 0x60f0B0F1Aa9ecd218D9003fD516343629DCd2556;
// GETTING THE AMOUNT OF DAI AND WETH STORED I UNISWAP
    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}
//getTokenReserves does exaxtly what it looks like LoL it gets the get the token reserves simplE!!!
// this is where you might get lost pay attention to what i did with address pair,
//i got the address by saying address pair equals UniswapV2Factory@ the factory addy, the .getPair is PASSING the ADDY of dai and weth, remembe rto pass you do a DOT "".""
//uint w reserve in () is geting the reserves!