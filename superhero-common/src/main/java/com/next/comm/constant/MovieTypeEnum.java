package com.next.comm.constant;

public enum MovieTypeEnum {

    SUPERHERO("superhero", "热门超英"),

    TRAILER("trailer", "热门预告");

    private String type;

    private String value;

    MovieTypeEnum(String type, String value) {
        this.type = type;
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
