package service;

import Model.user;

import java.util.List;

public interface AdminService {
    /**
     * 获取所有的用户信息
     * @return
     */
    List<user> userShowService();

    /**
     * 检查登录的是不是管理员
     * @return
     */
   boolean adminCheckService(String admId,String admPw);
}
