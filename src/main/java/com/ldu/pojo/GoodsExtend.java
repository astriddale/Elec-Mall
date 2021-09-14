package com.ldu.pojo;
/**
 * 电动车拓展 联合查询
 * @author swx
 *
 */
import java.util.ArrayList;
import java.util.List;

public class GoodsExtend{
	private Goods goods;
    public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	private List<Image> images = new ArrayList<Image>();
    private List<Comments> comments=new ArrayList<Comments>();

	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public List<Comments> getComments() {
		return comments;
	}
	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "GoodsExtend [goods=" + goods + ", images=" + images + ", comments=" + comments + "]";
	}
	
	
}