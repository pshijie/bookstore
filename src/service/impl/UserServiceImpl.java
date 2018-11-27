package service.impl;

import DAO.UserImp;
import Model.user;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserImp ui = new UserImp();
    //用户登录检测
    @Override
    public boolean checkUserLoginService(String Uid, String password) {
        return ui.checkUser(Uid,password);
    }
    //用户修改密码
    @Override
    public int userChangePwdService(String newPwd, String uid) {
        return ui.userChangePwd(newPwd,uid);
    }
    //用户注册
    @Override
    public int userRegService(user u) {
        return ui.addUsers(u);
    }
}
