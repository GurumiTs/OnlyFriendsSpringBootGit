package of.blog.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "BlogBean")
@Component("BlogBean")
public class BlogBean implements Serializable {

	@Id
	@Column(name = "ArticleID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer articleID;// 文章ID

	@Column(name = "Title")
	private String title;// 標題

	@Column(name = "CreateTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp createTime;// PO文日期

	@Column(name = "UpdateTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp updateTime;// 更新日期

	@Column(name = "MainText")
	private String mainText;// 內容

	@Column(name = "Images")
	private String images;// 圖片

	@Column(name = "EmpAcc")
	private String empAcc;// 管理人員ID

	@Column(name = "UserID")
	private String userID;// PO文者ID
	
	@Column(name = "WatchNum")
	private Integer watchNum;// 觀看數
	
	@Column(name = "Blogtype")
	private String blogType;// 文章分類
	
	public Integer getArticleID() {
		return articleID;
	}

	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getMainText() {
		return mainText;
	}

	public void setMainText(String mainText) {
		this.mainText = mainText;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getEmpAcc() {
		return empAcc;
	}

	public void setEmpAcc(String empAcc) {
		this.empAcc = empAcc;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	
	public Integer getWatchNum() {
		return watchNum;
	}

	public void setWatchNum(Integer watchNum) {
		this.watchNum = watchNum;
	}

	public String getBlogType() {
		return blogType;
	}

	public void setBlogType(String blogType) {
		this.blogType = blogType;
	}

	public BlogBean(Integer articleID, String title, Timestamp createTime, Timestamp updateTime, String mainText,
			String images, String empAcc, String userID, Integer watchNum, String blogType) {
		super();
		this.articleID = articleID;
		this.title = title;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.mainText = mainText;
		this.images = images;
		this.empAcc = empAcc;
		this.userID = userID;
		this.watchNum = watchNum;
		this.blogType = blogType;
	}

	public BlogBean() {
	}


}
