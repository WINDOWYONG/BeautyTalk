package com.kh.review.model.vo;

import com.kh.member.model.vo.Member;

public class Review {
	
	private String reviewNo;
	private String pcode;
	private int memNo;
	private String title;
	private String content;
	private String createDate;
	private int pRating;
	private int rRating;
	private int prRating;
	private int likeReview;
	private String status;

	public Review () {}

	public Review(String reviewNo, String pcode, int memNo, String title, String content, String createDate,
			int pRating, int rRating, int prRating, int likeReview, String status) {
		super();
		this.reviewNo = reviewNo;
		this.pcode = pcode;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.pRating = pRating;
		this.rRating = rRating;
		this.prRating = prRating;
		this.likeReview = likeReview;
		this.status = status;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getpRating() {
		return pRating;
	}

	public void setpRating(int pRating) {
		this.pRating = pRating;
	}

	public int getrRating() {
		return rRating;
	}

	public void setrRating(int rRating) {
		this.rRating = rRating;
	}

	public int getPrRating() {
		return prRating;
	}

	public void setPrRating(int prRating) {
		this.prRating = prRating;
	}

	public int getLikeReview() {
		return likeReview;
	}

	public void setLikeReview(int likeReview) {
		this.likeReview = likeReview;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", pcode=" + pcode + ", memNo=" + memNo + ", title=" + title
				+ ", content=" + content + ", createDate=" + createDate + ", pRating=" + pRating + ", rRating="
				+ rRating + ", prRating=" + prRating + ", likeReview=" + likeReview + ", status=" + status + "]";
	}

}
