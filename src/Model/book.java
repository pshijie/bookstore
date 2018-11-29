package Model;

public class book {
    private String Bid;//书的id
    private String Bname;//书名称
    private float Bprice;//书价格
    private int Bstock;//书库存
    private String Bpic;//书图片名称（id.png)
    private String Babstract;//书的描述

    public book(String bid, String bname, float bprice, int bstock,  String babstract,String bpic) {
        Bid = bid;
        Bname = bname;
        Bprice = bprice;
        Bstock = bstock;
        Babstract = babstract;
        Bpic = bpic;

    }

    public String getBid() {
        return Bid;
    }

    public void setBid(String bid) {
        Bid = bid;
    }

    public String getBname() {
        return Bname;
    }

    public void setBname(String bname) {
        Bname = bname;
    }

    public float getBprice() {
        return Bprice;
    }

    public void setBprice(float bprice) {
        Bprice = bprice;
    }

    public int getBstock() {
        return Bstock;
    }

    public void setBstock(int bstock) {
        Bstock = bstock;
    }

    public String getBpic() {
        return Bpic;
    }

    public void setBpic(String bpic) {
        Bpic = bpic;
    }

    public String getBabstract() {
        return Babstract;
    }

    public void setBabstract(String babstract) {
        Babstract = babstract;
    }

    @Override
    public String toString() {
        return "book{" +
                "Bid='" + Bid + '\'' +
                ", Bname='" + Bname + '\'' +
                ", Bprice=" + Bprice +
                ", Bstock=" + Bstock +
                ", Bpic='" + Bpic + '\'' +
                '}';
    }
}
