var username = null;
var websocket = null;

function init() {
    // hỏi username cho đến khi người dùng nhập
    while (username === null || username.trim() === "") {
        username = prompt("Enter username");
    }

    // mở kết nối đến JsonChatServerEndpoint
    websocket = new WebSocket(`ws://localhost:8088/Lab8/json/chat/${username}`);

    websocket.onopen = function (resp) {
        console.log("onopen", resp);
    };

    // ↓↓↓ PHẦN THẦY BẢO MÌNH TỰ VIẾT ↓↓↓
    websocket.onmessage = function (resp) {
        // resp.data là chuỗi JSON nhận từ server
        var msg = JSON.parse(resp.data);

        // hiển thị lời thoại vào vùng messages
        var output = document.getElementById('messages');
        output.innerHTML = `${output.innerHTML}<p><b>${msg.sender}</b>: ${msg.text}</p>`;

        // nếu là message loại "vào/ra" (type != 2) thì cập nhật số người đang online
        if (msg.type != 2) {
            document.getElementById('client-count').innerHTML =
                `Chatters: ${msg.count}`;
        }
    };
    // ↑↑↑ HẾT PHẦN onmessage ↑↑↑

    websocket.onerror = function (resp) {
        alert('An error occured, closing application');
        console.log("onerror", resp);
    };

    websocket.onclose = function (resp) {
        alert(resp.reason || 'Goodbye');
        console.log("onclose", resp);
    };
}

// Gửi tin nhắn JSON lên server
function send() {
    var input = document.getElementById("message");
    var msg = { sender: username, text: input.value, type: 2 };

    websocket.send(JSON.stringify(msg));
    input.value = '';
}
