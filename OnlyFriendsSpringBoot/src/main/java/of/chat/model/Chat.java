package of.chat.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "chat")
@Component("chat")
public class Chat implements Serializable{
	
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	@Column(name = "chattype")
	private MessageType type;
	@Column(name = "sender")
	private String sender;
	@Column(name = "receiver")
	private String receiver;
	@Column(name = "content")
	private String content;
	@Column(name = "texttime")
	private String texttime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}	
	
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTexttime() {
		return texttime;
	}
	public void setTexttime(String texttime) {
		this.texttime = texttime;
	}
	
	

	
	

}
