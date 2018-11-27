package Model;

public class user {
    private String name;//用户名
    private String password;//密码
    private String address;//地址
    private String phonenumber;//联系方式

    public user(String name, String password, String address, String phonenumber) {
        this.name = name;
        this.password = password;
        this.address = address;
        this.phonenumber = phonenumber;
    }

    @Override
    public String toString() {
        return "user{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
}
