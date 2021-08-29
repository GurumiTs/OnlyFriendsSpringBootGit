package of.chat.model;

public class ChatMessageModel {
	private MessageType type;
	private String content;
	private String sender;
	private String time;
	
	public ChatMessageModel() {
		
	}
	public ChatMessageModel(MessageType type, String content, String sender, String time) {
		this.type = type;
		this.content = content;
		this.sender = sender;
		this.time = time;
	}
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
	

}
