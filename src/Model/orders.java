package Model;

public class orders {
    private String Uid;//用户id
    private String Bid;//书id
    private String Oid;//订单编号
    private String stutas;//订单状态

    public orders(){

    }
    public orders(String uid, String bid, String oid, String stutas) {
        Uid = uid;
        Bid = bid;
        Oid = oid;
        this.stutas = stutas;
    }

    public String getUid() {
        return Uid;
    }

    public void setUid(String uid) {
        Uid = uid;
    }

    public String getBid() {
        return Bid;
    }

    public void setBid(String bid) {
        Bid = bid;
    }

    public String getOid() {
        return Oid;
    }

    public void setOid(String oid) {
        Oid = oid;
    }

    public String getStutas() {
        return stutas;
    }

    public void setStutas(String stutas) {
        this.stutas = stutas;
    }
}