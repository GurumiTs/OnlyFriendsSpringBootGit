package of.blogusers.model;

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
@Table(name = "BlogUsers")
@Component("BlogUsers")
public class BlogUser implements Serializable {

	@Id
	@Column(name = "UsersArticleID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer usersArticleID;// 文章ID

	@Column(name = "UsersTitle")
	private String usersTitle;// 標題

	@Column(name = "UsersCreateTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp usersCreateTime;// PO文日期

	@Column(name = "UsersUpdateTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp usersUpdateTime;// 更新日期

	@Column(name = "UsersMainText")
	private String usersMainText;// 內容

	@Column(name = "UsersImages")
	private String usersImages;// 圖片

	@Column(name = "MemberAccount")
	private String memberAccount;// 管理人員ID

	@Column(name = "UserName")
	private String userName;// PO文者ID

	@Column(name = "LikeNum")
	private Integer likeNum;// 點讚數

	public Integer getUsersArticleID() {
		return usersArticleID;
	}

	public void setUsersArticleID(Integer usersArticleID) {
		this.usersArticleID = usersArticleID;
	}

	public String getUsersTitle() {
		return usersTitle;
	}

	public void setUsersTitle(String usersTitle) {
		this.usersTitle = usersTitle;
	}

	public Timestamp getUsersCreateTime() {
		return usersCreateTime;
	}

	public void setUsersCreateTime(Timestamp usersCreateTime) {
		this.usersCreateTime = usersCreateTime;
	}

	public Timestamp getUsersUpdateTime() {
		return usersUpdateTime;
	}

	public void setUsersUpdateTime(Timestamp usersUpdateTime) {
		this.usersUpdateTime = usersUpdateTime;
	}

	public String getUsersMainText() {
		return usersMainText;
	}

	public void setUsersMainText(String usersMainText) {
		this.usersMainText = usersMainText;
	}

	public String getUsersImages() {
		return usersImages;
	}

	public void setUsersImages(String usersImages) {
		this.usersImages = usersImages;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(Integer likeNum) {
		this.likeNum = likeNum;
	}

}
