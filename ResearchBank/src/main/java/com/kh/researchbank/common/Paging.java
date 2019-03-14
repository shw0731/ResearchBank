package com.kh.researchbank.common;

public class Paging {

	private int currentPage;   // ����������
	private int totalCount;	 // ��ü �Խù� ��
	private int totalPage;	 // ��ü ������ ��
	private int blockCount;	 // �� ��������  �Խù��� ��
	private int blockPage;	 // �� ȭ�鿡 ������ ������ ��
	private int startCount;	 // �� ���������� ������ �Խñ��� ���� ��ȣ
	private int endCount;	 // �� ���������� ������ �Խñ��� �� ��ȣ
	private int startPage;	 // ���� ������
	private int endPage;	 // ������ ������
	private String url;

	private StringBuffer pagingHtml;

	// ����¡ ������
	public Paging(int currentPage, int totalCount, int blockCount,
			int blockPage, String url) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.url = url;

		// ��ü ������ ��
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// ���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// ���� �������� ó���� ������ ���� ��ȣ ��������.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// ���� �������� ������ ������ �� ���ϱ�.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// ������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// ���� block ������
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href=" + url + "?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
		}

		//������ ��ȣ.���� �������� ���������� �����ϰ� ��ũ�� ����.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href=" + url + "?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}

		// ���� block ������
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href=" + url + "?currentPage=" + (endPage + 1) + ">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
	}

	// Search�ִ� ������
	public Paging(int currentPage, int totalCount, int blockCount, int blockPage,String url, int searchNum, String isSearch){
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if(totalPage == 0){
			totalPage = 1;
		}
		
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		startCount = (currentPage -1) * blockCount;
		endCount = startCount + blockCount -1;
		
		startPage = (int)((currentPage -1) / blockPage) * blockPage +1;
		endPage = startPage + blockPage -1;
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		// ���� block ������
		pagingHtml = new StringBuffer();
		if(currentPage > blockPage){
			if(isSearch != "")
				pagingHtml.append("<a class='page prv' href=" + url + "?currentPage=" + (startPage - 1) + "&searchNum="+searchNum+ "&isSearch="+isSearch+">");
			else                    
				pagingHtml.append("<a class='page prv' href=" + url + "?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
			}
		
		//������ ��ȣ, ���� �������� �ٸ��� ǥ��
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			}
			else{
				pagingHtml.append("<a class='page' href=" + url + "?currentPage=" + i);
				if(isSearch != "")
					pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}
		// ���� block ������
		if(totalPage - startPage >= blockPage){
			pagingHtml.append("<a class='page next' href=" + url + "?currentPage=" + (endPage + 1));
			if(isSearch != "")
				pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
			pagingHtml.append(">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
			
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String geturl() {
		return url;
	}

	public void seturl(String url) {
		this.url = url;
	}
}