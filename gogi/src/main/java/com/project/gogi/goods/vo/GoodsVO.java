package com.project.gogi.goods.vo;

import java.util.Date;

public class GoodsVO {
	/*0713 ������ ����*/
	
    private int goods_id;//��ǰID
    private String goods_category; //��ǰ����
    private String goods_name;//��ǰ��
    private String goods_seller; //�Ǹ���
    private String goods_origin; //������
    private int goods_price;//��ǰ����
    private int goods_point;//��ǰ ����Ʈ - ����Ʈ ������� ���� �ʿ�
    private Date good_delivery_date; //��ǰ�����
    private String goods_explanation; //��ǰ����
    private String goods_status; //��ǰ �з� (����Ʈ(B), ����(S), �⺻(N))
    
    
    public GoodsVO() {}
    
	public GoodsVO(int goods_id, String goods_category, String goods_name, String goods_seller, String goods_origin,
			int goods_price, int goods_point, Date good_delivery_date, String goods_explanation, String goods_status) {
		super();
		this.goods_id = goods_id;
		this.goods_category = goods_category;
		this.goods_name = goods_name;
		this.goods_seller = goods_seller;
		this.goods_origin = goods_origin;
		this.goods_price = goods_price;
		this.goods_point = goods_point;
		this.good_delivery_date = good_delivery_date;
		this.goods_explanation = goods_explanation;
		this.goods_status = goods_status;
	}
	
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_seller() {
		return goods_seller;
	}
	public void setGoods_seller(String goods_seller) {
		this.goods_seller = goods_seller;
	}
	public String getGoods_origin() {
		return goods_origin;
	}
	public void setGoods_origin(String goods_origin) {
		this.goods_origin = goods_origin;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_point() {
		return goods_point;
	}
	public void setGoods_point(int goods_point) {
		this.goods_point = goods_point;
	}
	public Date getGood_delivery_date() {
		return good_delivery_date;
	}
	public void setGood_delivery_date(Date good_delivery_date) {
		this.good_delivery_date = good_delivery_date;
	}
	public String getGoods_explanation() {
		return goods_explanation;
	}
	public void setGoods_explanation(String goods_explanation) {
		this.goods_explanation = goods_explanation;
	}
	public String getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}
    
    
    
}
