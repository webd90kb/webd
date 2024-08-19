### [Chat Room with WebRTC Video Call Support https://cnt2.cf/groups/login.html](https://cnt2.cf/groups/login.html)
- This chat room takes a different approach—there are no predefined or public room lists. Create a room and then share the group name & password or a link with others to join.
- If don’t have anyone to chat with right away, open a new browser tab or use another device to join the room just created.
- I can assure that the server will never have access to any chat content. The front-end code is lightweight, and if have the tools or want to analyze it with AI:
The encryption key for the chat content is derived from the group name and password, with salt added and a special process applied.
The chat room ID is determined by hashing the group name and password.
Something like this:
key = keygen(funcA(hashA(group_name, group_pass, salt_A)));
RoomId = hashB(group_name, group_pass, salt_B));
- The server only knows the RoomId. The client knows both the RoomId and the key, but the key cannot be derived from the RoomId. This ensures that neither the server nor any network operators can access your chat content.
- If there are just two people in the chat room, you can start a video call by clicking the phone icon. If there are more than two people, you’ll need to select a person first before initiating a call. Have fun!

### No Registration Needed.
- Just pick up some random groupname&password and nickname to login.
- Share the same groupname&password to others to let them join in the same chatroom.
- Same groupname with a different password will lead to a different chatroom.
### Video Call Supported.
- If only two in chatroom, just click the phone button to video call another one.
- If there's more than two, first click one's name to enter private chat mode, then click the phone button.
- Also in private chat mode, text message only send to the one target, and the text color is different.

### Screenshots
![image](https://github.com/webd90kb/webd/blob/master/chatrooms/01_login.png)
![image](https://github.com/webd90kb/webd/blob/master/chatrooms/02_share.png)
![image](https://github.com/webd90kb/webd/blob/master/chatrooms/03_share_login.png)
![image](https://github.com/webd90kb/webd/blob/master/chatrooms/04_chat.png)
