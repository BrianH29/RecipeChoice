package com.kh.admin.faq.model.vo;

public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String status;


	public Faq() {
		
	}


	public Faq(int faqNo, String faqTitle, String faqContent, String status) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.status = status;
	}
	


	public Faq(int faqNo, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	
	




	public int getFaqNo() {
		return faqNo;
	}


	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}


	public String getFaqTitle() {
		return faqTitle;
	}


	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}


	public String getFaqContent() {
		return faqContent;
	}


	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", status=" + status
				+ "]";
	}
	
	

}

