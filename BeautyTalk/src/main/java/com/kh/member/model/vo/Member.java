package com.kh.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String nickName;
	private Date birthday;
	private String phone;
	private Date enrollDate;
	private String status;
	private String agreeYN;
	private String gender;
	
	
	public Member () {}


	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			Date birthday, String phone, Date enrollDate, String status, String agreeYN, String gender) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.birthday = birthday;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.status = status;
		this.agreeYN = agreeYN;
		this.gender = gender;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getAgreeYN() {
		return agreeYN;
	}


	public void setAgreeYN(String agreeYN) {
		this.agreeYN = agreeYN;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", nickName=" + nickName + ", birthday=" + birthday + ", phone=" + phone
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", agreeYN=" + agreeYN + ", gender=" + gender
				+ "]";
	}

	
}


