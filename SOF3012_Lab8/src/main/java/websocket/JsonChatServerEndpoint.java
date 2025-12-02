package websocket;

import jakarta.websocket.EncodeException;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(
        value = "/json/chat/{username}",
        encoders = MessageEncoder.class,
        decoders = MessageDecoder.class
)
public class JsonChatServerEndpoint {

    private static Map<String, Session> sessions = new HashMap<>();

    // Gửi message (Object) cho tất cả session
    private void broadcast(Message message) {
        sessions.forEach((username, session) -> {
            try {
                session.getBasicRemote().sendObject(message);
            } catch (IOException | EncodeException e) {
                e.printStackTrace();
            }
        });
    }

    @OnOpen
    public void onOpen(@PathParam("username") String username, Session session){
        // nếu username đã tồn tại thì báo lỗi
        if (sessions.containsKey(username)) {
            throw new RuntimeException("Username already exists");
        } else {
            // lưu username vào userProperties, và session vào Map
            session.getUserProperties().put("username", username);
            sessions.put(username, session);

            // tạo message thông báo có người vừa vào
            Message message = new Message(
                    "joined the chat", // text
                    0,                 // type 0: vào
                    username,          // sender
                    sessions.size()    // count: số client hiện tại
            );
            this.broadcast(message);
        }
    }

    @OnMessage
    public void onMessage(Message message, Session session) {
        // message nhận được từ client đã là Object Message (do Decoder xử lý)
        this.broadcast(message);
    }

    @OnClose
    public void onClose(Session session) {
        // lấy username từ userProperties
        String username = (String) session.getUserProperties().get("username");

        if (username != null) {
            sessions.remove(username);

            // tạo message thông báo có người rời phòng
            Message message = new Message(
                    "left the chat",   // text
                    1,                 // type 1: ra
                    username,          // sender
                    sessions.size()    // count: số client hiện tại
            );
            this.broadcast(message);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        try {
            if (session != null && session.isOpen()) {
                session.close();
            }
        } catch (IOException e) {
            throw new RuntimeException("Unable to close session");
        }
    }
}
