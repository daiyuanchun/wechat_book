package com.yuxudong.po;

public class Book {
    private String isbn;

    private String name;

    private String title;

    private String author;

    private String press;

    private String version;

    private Integer number;

    private String miniature;

    private String allname;

    private String cover;

    private String sequence;

    private String catalog;

    private String content;

    private String bookreview;

    private String guidance;

    private String qrcode;

    private Integer flag;

    private Integer typeid;

    private Integer provinceid;

    private String city;

    private Integer cityid;

    private Integer restnum;
    
    private Type type;
    
    private Province province;

    public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getMiniature() {
        return miniature;
    }

    public void setMiniature(String miniature) {
        this.miniature = miniature == null ? null : miniature.trim();
    }

    public String getAllname() {
        return allname;
    }

    public void setAllname(String allname) {
        this.allname = allname == null ? null : allname.trim();
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence == null ? null : sequence.trim();
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog == null ? null : catalog.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getBookreview() {
        return bookreview;
    }

    public void setBookreview(String bookreview) {
        this.bookreview = bookreview == null ? null : bookreview.trim();
    }

    public String getGuidance() {
        return guidance;
    }

    public void setGuidance(String guidance) {
        this.guidance = guidance == null ? null : guidance.trim();
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode == null ? null : qrcode.trim();
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getProvinceid() {
        return provinceid;
    }

    public void setProvinceid(Integer provinceid) {
        this.provinceid = provinceid;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public Integer getCityid() {
        return cityid;
    }

    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }

    public Integer getRestnum() {
        return restnum;
    }

    public void setRestnum(Integer restnum) {
        this.restnum = restnum;
    }
}