// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
//import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// contract testInt{
//     int8 a = -1;
//     int16 b = 2;
//     uint32 c = 12;
//     uint64 d = 16;

//     function addTest(uint x,uint z) public pure returns (uint s){
//          s = x + z;
//     }

//     function divdle(uint y,uint z)public pure returns (uint a){
//          a =  y/z;
//     }

//     function leftshift(uint x, uint z) public pure returns (uint b){
//          b = x << z;
//     }

//     function rightshift(uint x,uint z) public pure returns (uint b){
//         b = x >> z;
//     }

//     function testPluePlus() public pure returns (uint){
//         uint x = 1;
//         uint y = ++x;
//         return y;
//     }
// }

// contract testOverflow {
//     function add1() public pure returns (uint8){
//         uint8 x = 128;
//         uint8 y = x * 2;
//         return y;
//     }
//     function add2() public pure returns (uint8){
//         uint8 i = 240;
//         uint8 j = 16;
//         uint8 k = i + j;
//     }
//     function sub1() public pure returns (uint8){
//         uint8 m =1;
//         uint8 n = m - 2;
//         return n;
//     }
//     function add(uint256 z,uint256 y) internal pure returns (uint256){
//         uint256 c = z + y;
//         require(c >= z);
//         return c;
//     }
// }

// contract testAddress{
// // 定义一个address类型变量
// address public myAddress;
// // 初始化address 变量
// // myAddress = 0x1234567890123456789012345678901234567890;

// address myAddress1 = 0x1234567890123456789012345678901234567890;
// address myAddress2 = msg.sender;//当前合约调用者的地址
// // if (myAddress1 == myAddress2){
    
// // } else {

// // }
// // 将 address 转化 address payable之间的转换
// address payable payAddress = payable (myAddress1);

// uint256 balch = myAddress.balance; // 获取地址余额（单位：wei）

// address payable recipet = payable(0x1234567890123456789012345678901234567890);
// recipet.transfer(1 ether); // 转移1 ETH

// bool succes = recipet.send(1 ether); // 转移 1 ETH，返回是否成功
// require(success,"Transfer failed.");

// （bool success,） = require.call{value: 1 ether}(""); // 使用call 转移 1ETH
// require(success,"Transfer failed.");

// // 白名单机制
// mapping(address => bool) public whitelist;

// function addToWhitelist(address _address) public {
//     whitelist[_address] = true;
// }

// function isWhitelisted(address _address) public view returns (bool){
//     return whitelist[_address];
// }

// // 授权支付合约
// function pay(address payable recipient) public payable {
//     require(whitelist[recipient], "Recipient is not whitelisted.");
//     recipient.transfer(msg.value);
// }

// // 安全性
// function withdress(uint256 amout) public {
//     require(balances[msg.sender] >= amout,"Insufficient balances." );

//     // 更新余额
//     balances[msg.sender] -= amount;

//     // 转账
//     (bool success,) = msg.sender.call{value:amout}("");
//     require(success,"Transfer failed.");
// }

// // 存款函数
// function depost() public payable {
//     balances[msg.sender] += msg.value;
// }
// }

// 练习：实现一个简单的存款和取款合约
// contract SimpleWaller {
//     mapping(address >= uint256) public balances;

//     function deposit() public payable {
//         balances[msg.sender] += msg.value;
//     } 

//     function withdraw(uint256 amout) public {
//         require(balances[msg.sender] >= amout,"Insuffcient balances.");
//         balances[msg.sender] -= amout;
//         payable(msg.sender).transfer(amout);
//     }
//     function checkBalance() public view returns (uint256){
//         return balances[msg.sender];
//     }
// }

// contract Hello {
//      function sayHi() public {
//         // 合约中的成员函数
//      }
//      // 可支付回退函数
//      receive() external payable {

//      }
//      function getAddress() public view returns (address){
//         //返回当前合约的地址
//         return address(this); 
//      }
//     //  function destroyContract(address payable recipient) public {
//     //     selfdestruct(recipient); // 销毁合约发送以太币
//     //  }
//     //  function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
//     //     return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
//     // }
//     function getConter() public pure returns (string memory){
//         return type(Hello).name;
//     }
// }

// contract Function{
//     // bytes4 selector = bytes4(keccak256("functionName(uint256)"));

//     // bytes4 selector = this.functionName.selector;
// //     function select(bytes4 selector, uint x) external returns (uint z) {
// //     (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
// //     require(success, "Function call failed");
// //     z = abi.decode(data, (uint));
// // }

// //     function setFunction(bytes selector) external {
// //         func = selector; // 将选择器存储在状态变量中
// //     }

// // 状态变量，用于存储函数选择器
// bytes public storedSelector;
// // 函数：计算输入值的平方
// function square(uint x) public pure returns (uint){
//     return x * x;
// }
// // 函数：计算输入值的二倍
// function double(uint x) public pure returns (uint) {
//     return 2 * x;
// }
// // 函数：根据传入的选择器动态调用square或者double函数
// function executeFunction(bytes4 selector,uint x) public returns (uint){
//     (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
//     require(success,"Function call failed");
//     return abi.decode(data, (uint));
// }
// // 函数： 存储选择器到状态变量 storedSelector
// function storeSelector(bytes selector) public {
//     storedSelector = selector
// }
// // 函数：调用存储在storedSelector 中的函数，并返回结果
// function executeFunction(uint x) public returns (uint){
//     require(storedSelector != bytes4(0),"Selector not set");
//     (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
//     require(success,"Function call failed");
//     return abi.decode(data, (uint));
// }
    
// }

//contract TestFunc {
//
//  function a(uint x) external pure returns (uint z) {
//        return x * x;
//    }
//
//    function b(uint x) external pure returns (uint z) {
//        return 2 * x;
//    }
//
//    function getSelector() external pure returns (bytes4) {
//    return this.a.selector; // 返回函数a的选择器
//}
//    // bytes4 selector = bytes4(keccak256("a(uint256)"));
//
//    function select(bytes4 selector, uint x) external returns (uint z) {
//    (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
//    require(success, "Function call failed");
//    z = abi.decode(data, (uint));
//}
//
//}

// contract ERC256Req is IERC165 {
//     bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;
//     mapping(bytes4 => bool) private _supportedInterfaces;

//     constructor() {
//         _registerInterface(_INTERFACE_ID_ERC165);
//     }

//     function supportsInterface(bytes4 interfaceId) external view returns (bool) {
//         return _supportedInterfaces[interfaceId];
//     }

//     function _registerInterface(bytes4 interfaceId) internal {
//         require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
//         _supportedInterfaces[interfaceId] = true;
//     }
// }

// ERC165 接口定义
// interface IERC165 {
//     function supportsInterface(bytes4 interfaceId) external view returns (bool);
// }

// // 自定义接口 1
// interface ICustomInterface1 {
//     function customFunction1() external;
// }

// // 自定义接口 2
// interface ICustomInterface2 {
//     function customFunction2() external;
// }

// // 实现 ERC165 的合约
// contract ERC165CompliantContract is IERC165 {
//     mapping(bytes4 => bool) private _supportedInterfaces;

//     constructor() {
//         // 注册 ERC165 接口
//         _registerInterface(type(IERC165).interfaceId);
//         // 注册自定义接口 1
//         _registerInterface(type(ICustomInterface1).interfaceId);
//         // 注册自定义接口 2
//         _registerInterface(type(ICustomInterface2).interfaceId);
//     }

//     function supportsInterface(bytes4 interfaceId) external view override returns (bool) {
//         return _supportedInterfaces[interfaceId];
//     }

//     function _registerInterface(bytes4 interfaceId) internal {
//         require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
//         _supportedInterfaces[interfaceId] = true;
//     }
// }

// ERC165 接口定义，用于支持接口查询
// interface IERC165 {
//     function supportsInterface(bytes4 interfaceId) external view returns (bool);
// }

// // ERC721 接口定义
// interface IERC721 is IERC165 {
//     function balanceOf(address owner) external view returns (uint256 balance);
//     function ownerOf(uint256 tokenId) external view returns (address owner);
//     function safeTransferFrom(address from, address to, uint256 tokenId) external;
//     function transferFrom(address from, address to, uint256 tokenId) external;
//     function approve(address to, uint256 tokenId) external;
//     function getApproved(uint256 tokenId) external view returns (address operator);
//     function setApprovalForAll(address operator, bool _approved) external;
//     function isApprovedForAll(address owner, address operator) external view returns (bool);
//     function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
// }

// // ERC1155 接口定义
// interface IERC1155 is IERC165 {
//     function balanceOf(address account, uint256 id) external view returns (uint256);
//     function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids) external view returns (uint256[] memory);
//     function setApprovalForAll(address operator, bool approved) external;
//     function isApprovedForAll(address account, address operator) external view returns (bool);
//     function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;
//     function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external;
// }

// // 用于检查交互合约是否实现特定标准的合约
// contract InterfaceChecker {
//     // ERC721 接口 ID
//     bytes4 private constant ERC721_INTERFACE_ID = 0x80ac58cd;
//     // ERC1155 接口 ID
//     bytes4 private constant ERC1155_INTERFACE_ID = 0xd9b67a26;

//     // 检查目标合约是否实现 ERC721 标准
//     function isERC721(address targetContract) external view returns (bool) {
//         IERC165 target = IERC165(targetContract);
//         return target.supportsInterface(ERC721_INTERFACE_ID);
//     }

//     // 检查目标合约是否实现 ERC1155 标准
//     function isERC1155(address targetContract) external view returns (bool) {
//         IERC165 target = IERC165(targetContract);
//         return target.supportsInterface(ERC1155_INTERFACE_ID);
//     }
// }

// ERC721 接口定义
//contract OptimizedTestREC is ERC721URIStorage {
//    using Counters for Counters.Counter;
//    Counters.Counter private _tokenIds;
//
//
//    constructor() ERC721("MyCollectibles", "MC") {}
//
//
//    function mintCollectible(address recipient, string memory tokenURI) public returns (uint256) {
//
//        _tokenIds.increment();
//
//        uint256 newTokenId = _tokenIds.current();
//
//        _mint(recipient, newTokenId);
//
//        _setTokenURI(newTokenId, tokenURI);
//
//        return newTokenId;
//    }
// 重写 _burn 函数
//    function _burn(uint256 tokenId) internal override {
//        super._burn(tokenId);
//    }
//
//    function tokenURI(uint256 tokenId)public view override returns (string memory){
//        return super.tokenURI(tokenId);
//    }
//}

//contract TestEnumer is ERC721Enumerable {
//    constructor()public {}
//
//    // function getTotalsumple() public view return (uint256){
//    //     return totalSupply();
//    // }
//
//    // 获取特定索引位置的 NFT
//    function getTokenByIndex(uint256 index) public view returns (uint256) {
//        return tokenByIndex(index);
//    }
//    // 根据地址获取NFT数量
//    function getBalanceOf(address _address) public view returns(uint256){
//        return balanceOf(_address);
//    }
//
//    function getTokenOfOwnerByIndex(address _address,uint256 indexes) public view return (uint256) {
//return tokenOfOwnerByIndex(_address,indexes);
//}
//
//}


//contract MyTestEPC is ERC1155 {
//    // 定义金币从零开始
//    uint256 public constant maxSupply = 0;
//    // 定义非同质化代币
//    uint256 public ftzh = 1;
//
//    string private USER;
//
//    constructor(string memory _baseURI) ERC1155(_baseURI) {
//        _mint(msg.sender, maxSupply, 1000, "");
//    }
//// 金币
//    function minGold(address _address,uint256 aomint) public {
//        _mint(_address, maxSupply, aomint, "");
//    }
//// 非同质化代币
//    function minFtzh (address _address, uint256 amint) public returns (uint256) {
//        uint256 ftzhs = ftzh;
//        _mint(_address, ftzhs, 1, "");
//        ftzh++;
//        return ftzh;
//    }
//// 转移代币
//    function getSafeBatchTransferFrom(address deployerAddress,address playerAddress,uint256[] memory tokenIds, uint256[] memory ampit) public returns (uint256){
//        safeBatchTransferFrom(deployerAddress,playerAddress,tokenIds,ampit,"0x0");
//        return  balanceOf(deployerAddress,tokenIds[0]);
//    }
//
//}
