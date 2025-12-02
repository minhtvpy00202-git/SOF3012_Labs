package websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/text/chat")   // endpoint url theo đề bài
public class TextChatServerEndpoint {

    // Duy trì danh sách session của các client đang kết nối
    private static Map<String, Session> sessions = new HashMap<>();

    // Gửi message đến tất cả client đang kết nối
    private void broadcast(String message) {
        sessions.forEach((id, session) -> {
            try {
                // Gửi đúng nội dung message theo hướng dẫn trong Lab
                session.getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    // Được gọi khi client kết nối vào server
    @OnOpen
    public void onOpen(Session session) {
        // lưu session mới
        sessions.put(session.getId(), session);
        // thông báo cho tất cả mọi người
        this.broadcast("Someone joined the chat!");
    }

    // Được gọi khi server nhận tin nhắn từ client
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            // chuyển tiếp (broadcast) tin nhắn cho tất cả mọi người
            this.broadcast(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Được gọi khi client đóng kết nối
    @OnClose
    public void onClose(Session session) {
        // xóa session ra khỏi danh sách
        sessions.remove(session.getId());
        // thông báo cho mọi người
        this.broadcast("Someone left the chat!");
    }

    // Được gọi khi có lỗi xảy ra trong giao tiếp
    @OnError
    public void onError(Session session, Throwable throwable) {
        try {
            if (session != null && session.isOpen()) {
                session.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
