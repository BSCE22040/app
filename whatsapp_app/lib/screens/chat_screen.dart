import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatScreen extends StatefulWidget {
  final String contactName;
  
  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showSendButton = false;
  List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  late String contactName;

  @override
  void initState() {
    super.initState();
    contactName = widget.contactName; 
    // Add some sample messages
    messages.addAll([
      Message(
        text: "😂😂😂😂😂😂",
        timestamp: DateTime.now().subtract(Duration(hours: 22)),
        isDelivered: true,
        isRead: true,
      ),
      Message(
        text: "👋 how are you doing today",
        timestamp: DateTime.now().subtract(Duration(hours: 22)),
        isDelivered: true,
        isRead: true,
      ),
      Message(
        text: "Everything is good?",
        timestamp: DateTime.now().subtract(Duration(hours: 22)),
        isDelivered: true,
        isRead: true,
      ),
    ]);
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: _controller.text,
          timestamp: DateTime.now(),
          isDelivered: true,
          isRead: false,
        ));
        _controller.clear();
        showSendButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF128C7E), // WhatsApp green
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600], size: 20),
            ),
            SizedBox(width: 10),
            Text(
              contactName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/whatsapp_bg.png'), // Optional background
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: messages.length + 2, // +2 for date separator and encryption notice
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Date separator
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Yesterday",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (index == 1) {
                    // Encryption notice
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF3C1), // Light yellow
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock, size: 16, color: Colors.grey[600]),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Messages and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Message bubble
                    final messageIndex = index - 2;
                    final message = messages[messageIndex];
                    return Container(
                      margin: EdgeInsets.only(bottom: 4),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          margin: EdgeInsets.only(left: 60, right: 8, top: 2, bottom: 2),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFDCF8C6), // WhatsApp light green
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message.text,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    DateFormat('h:mm a').format(message.timestamp),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    message.isRead ? Icons.done_all : Icons.done,
                                    size: 14,
                                    color: message.isRead ? Color(0xFF4FC3F7) : Colors.grey[600],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.grey[600]),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: TextField(
                        controller: _controller,
                        onChanged: (text) {
                          setState(() {
                            showSendButton = text.isNotEmpty;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),
                  if (showSendButton)
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF128C7E),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: Icon(Icons.send, color: Colors.white, size: 20),
                      ),
                    )
                  else ...[
                    IconButton(onPressed: () {}, icon: Icon(Icons.note, color: Colors.grey[600])),
                    IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt, color: Colors.grey[600])),
                    IconButton(onPressed: () {}, icon: Icon(Icons.mic, color: Colors.grey[600])),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime timestamp;
  final bool isDelivered;
  final bool isRead;

  Message({
    required this.text,
    required this.timestamp,
    this.isDelivered = false,
    this.isRead = false,
  });
}