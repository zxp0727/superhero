package com.next.comm.constant;

public enum Status {
    OK(200),
    ERR(500),
    EXCEPTION(501),
    NOTFOND(404);

    private int value;

    Status(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
