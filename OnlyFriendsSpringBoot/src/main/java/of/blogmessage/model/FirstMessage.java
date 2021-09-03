package of.blogmessage.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "BlogMessage")
@Component("BlogMessage")
public class FirstMessage implements Serializable {
	
	@Id
	@Column(name = "MessageID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageID;
	
	@JoinColumn(name = "UsersArticleID",referencedColumnName = "UsersArticleID")
	private Integer usersArticleID;
	
	@Column(name = "MemberName")
	private String memberName;
	
	@Column(name="MemberPic")
	private String memberPic;
	
	@Column(name = "MessageTime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp messageTime;// 更新日期
	
	@Column(name = "MessageText")
	private String messageText;
	
	@Column(name = "MessageLikeNum")
	private Integer messageLikeNum;

	public Integer getMessageID() {
		return messageID;
	}

	public void setMessageID(Integer messageID) {
		this.messageID = messageID;
	}

	public Integer getUsersArticleID() {
		return usersArticleID;
	}

	public void setUsersArticleID(Integer usersArticleID) {
		this.usersArticleID = usersArticleID;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPic() {
		return memberPic;
	}

	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}

	public Timestamp getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(Timestamp messageTime) {
		this.messageTime = messageTime;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public Integer getMessageLikeNum() {
		return messageLikeNum;
	}

	public void setMessageLikeNum(Integer messageLikeNum) {
		this.messageLikeNum = messageLikeNum;
	}
	
	
}
