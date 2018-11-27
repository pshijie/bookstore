package service.impl;

import DAO.AdminImp;
import DAO.UserImp;
import Model.user;
import service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    AdminImp ai = new AdminImp();
    //查询所有用户
    @Override
    public List<user> userShowService() {
        return ai.queryAllUsers();
    }

    @Override
    public boolean adminCheckService(String admId,String admPw) {
        return ai.checkAdm(admId,admPw);
    }
}
