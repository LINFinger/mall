package com.how2java.tmall.pojo;

import java.util.List;

public class User {
    private Integer id;

    private String name;

    private String email;

    private String trueName;

    private String password;

    private String address;

    private String phone;

    public List<AccountInfo> receiverInfo;

    public List<AccountInfo> getReceiverInfo() {
        return receiverInfo;
    }

    public void setReceiverInfo(List<AccountInfo> receiverInfo) {
        this.receiverInfo = receiverInfo;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    private String sex;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getPostal() {
        return postal;
    }

    public void setPostal(Integer postal) {
        this.postal = postal;
    }

    private Integer postal = 0;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
    
    /**
     * 在显示评价者的时候进行匿名显示
     * 用户名称长度为1，显示*
     * 用户名称长度为2，显示第一位+*
     * 大于2时，只显示首位，其他显示*
     */
    public String getAnonymousName() {
    	 if(null==name)
             return null;
  
         if(name.length()<=1)
             return "*";
  
         if(name.length()==2)
             return name.substring(0,1) +"*";
  
         char[] cs =name.toCharArray();
         for (int i = 1; i < cs.length-1; i++) {
             cs[i]='*';
         }
         return new String(cs);
    }
}