package com.baokaka.payload;

public class RequestRegister {
    String fullName;
    String userName;
    String passWord;
    String birthday;

    public RequestRegister(String fullName, String userName, String passWord, String birthday) {
        this.fullName = fullName;
        this.userName = userName;
        this.passWord = passWord;
        this.birthday = birthday;
    }

    public RequestRegister() {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}
