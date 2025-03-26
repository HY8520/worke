    什么情况下应该使用 uint 或 int?
    存储整数 数量 索引 使用 uint int uint 无符号整数
    init 有符号整数 允许负值场景
    
    如何选择存储以太坊地址使用的数据结构？
    address 适用于用户钱包 合约地址
    
    在何时使用 string 与 bytes?
    string 存储可变长度文本数据 bytes 处理不需要字符编码原始字节数据
    string public key;
    bytes32 public hash;
    
    数组在 Solidity 中的应用场景是什么？
    数组用于存储相同类型元素列表，存储多个值 数字列表，状态列表
    uint8[] public status;
    
    为何以及如何使用 mapping?
    mapping 用于创建键值对映射，常用于存储关联数据，如用户余额
    mapping(address => uint256) public balances;
    
    struct 的用途及实例?
    struct 允许创建自定义数据结构，包含不同类型字段，适用于复杂数据组合
    struct Course{ string name; uint8 score; }
    
    何时使用 enum 以及其好处是什么？
    enum 用于定义一组命名常量，限制变量取值范围，适用于有限选项情况 enum Status{Valid,Invalid}
    
    在设计合约时如何考虑存储和 Gas 成本？
    使用高效数据结构减少存储和执行成本 例如：mapping比数组更节省gas,特别是大规模数据查找
    
    如何根据数据访问模式选择数据结构？
    根据合约的数据访问频率和类型选择数据结构 mapping 适合频繁变动数据 数组 适合静态数据或顺序访问的数据
    
    在复杂合约中选择数据结构的考虑因素有哪些？
    评估合约功能需求，选择数据结构 复杂合约需要结合多种数据结构 struct mapping
    
    如何决定使用固定长度的数组还是动态数组？
    事先知道数组最大长度，并且长度不会变，使用固定长度数组可以节省gas成本 如果数组长度会动态变化，应选择动态数组
    
    在 Solidity 中使用 mapping 和 array 的主要区别及使用场景是什么？
    mapping 快速查找和更新键值对， 适用于账户余额 array 适用于元素顺序或者需要迭代处理
    
    mapping(address => uint256) public userBalances; address[] public users;
    
    如何利用 struct 在 Solidity 中模拟传统的数据库表？
    struct定义表的列，使用mapping或数组存储struct 模拟行 struct Student{ uint256 id; string name; uint256 classRoomId;
    } mapping(uint256 => Student) public students;
    
    Solidity 中 enum 如何帮助降低错误的发生？
    enum 限制变量取值范围，减少非法值输入，提高代码可维护性和错误预防
    
    为何 bytes 类型有时比 string 更优？
    当不需要字符处理的纯二进制数据时，bytes更节省空间gas 因为不设计utf-8编码处理
    
    如何选择在 Solidity 中存储时间的最佳数据结构？
    uint256 常用来存储时间戳
    因为它可以直接与ethereum虚拟机时间函数兼容
    
    在 Solidity 合约中，何时应考虑将数据封装在 struct 内部？
    当数据逻辑上属于同一实体或需要一起处理时，应该封装一个stuct内部 增强可读性和可维护性
    struct Order{ uint256 orderId; uint256 quatity; uint256 price; address purchaser; }
    
    mapping 类型是否支持迭代？如果不支持，如何解决？
    mapping本身不支持迭代，如果需要迭代，可以维护一个单独的数组来存储所有键， 然后通过这些键来访问
    mapping(address => uint256) public accounts; address[] public accountList;
    
    在设计一个包含多种资产类型的钱包合约时，应使用哪种数据结构？
    可以使用mapping将资产类型 映射到另一个mapping（用户地址映射到余额）
    mapping(address => mapping(address => uint256)) public balances;
    
    使用 enum 定义状态时，应如何处理状态的转换逻辑？
    定义状态转换函数 应该包含状态验证逻辑，确保合约状态按预定流程转换
    enum Status{Start, Proccessing, Done}
    Status public status = Status.Start;
    function nextStatus() public{ if(status == Status.Start){ status = Status.Processing; } else if (status == Status.Processing){ status = Status.Done; } }