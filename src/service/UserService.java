package service;

import Model.user;

import java.util.List;

public interface UserService {
    /**
     * 检查用户登录
     * @param Uid
     * @param password
     * @return
     */
    boolean checkUserLoginService(String Uid, String password);

    /**
     * 修改用户密码
     * @param newPwd
     * @param uid
     * @return
     */
    int userChangePwdService(String newPwd,String uid);



    /**
     * 用户注册
     * @param u
     * @return
     */
    int userRegService(user u);
}
