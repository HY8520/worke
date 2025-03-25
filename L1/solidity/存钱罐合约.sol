// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Bank {
    // 状态变量
    address public immutable owner;

    //事件
    event Deposit(address _add,uint256 amout);
    event Withdraw(uint256 amount);
    // receive
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
    // 构造函数
    constructor() payable {
        owner = msg.sender;
    }
    // 方法
    function withdraw() external {
        require(msg.sender == owner, "Not Owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}


question := dao.NewQuestionBank(ctx, nil)
aubitLog := dao.NewAubitLog(ctx, nil)
userID, ok := ctx.Value(consts.CtxUserID).(uint64)
if !ok {
logger.AppLog.Errorf("operation log add error:%s", "userID is nil")
//return
}
user, _ := Auth.Info(ctx, &requests.AdminInfoReq{ID: userID})
_, err := question.GlobalUpdate(map[string]interface{}{
"state":       req.State,
"audit_id":    user.ID,
"update_time": time.Now(),
"audit_time":  time.Now(),
}, "id = ?", req.ID)
aubitLog.BankId = uint64(req.ID)
aubitLog.Tetle = consts.State[req.State]
aubitLog.UserId = user.ID
aubitLog.Remark = req.Remark
aubitLog.CreateTime = time.Now()
err = aubitLog.GlobalCreate()

return err