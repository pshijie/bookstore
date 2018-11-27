package Model;

public class admin {
    private String admName;
    private String admId;

    public admin(String admName, String admId) {
        this.admName = admName;
        this.admId = admId;
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName;
    }

    public String getAdmId() {
        return admId;
    }

    public void setAdmId(String admId) {
        this.admId = admId;
    }
}
