import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/chat_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Color selectedBackground = Color(0xFFE1F5E2);
  final Color unselectedBackground = Color(0xFFF0F0F0);
  final Color selectedText = Color(0xFF128C7E);
  final Color unselectedText = Color(0xFF5F5F5F);
  final List<String> filters = ["All", "Unread", "Groups", "Favourites", "Family"];
  String selectedFilter = "All";
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
        // Remove bottom padding from AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reduced padding here for the "Chats" text
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0, bottom: 4.0),
            child: Text(
              "Chats",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Reduced padding for the TextField
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 4.0, bottom: 8.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.circle_outlined, color: Colors.lightBlue),
                hintText: "Ask Meta Ai or Search",
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                ),
                // Make the text field more compact
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
          ),
          SizedBox(height: 5,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: filters.map((filter) {
                bool isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? selectedBackground : unselectedBackground,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      elevation: 0,
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? selectedText : unselectedText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 5),
          // Your chat row
          Expanded(
      child: ListView(
        children: [
          ChatTile(name: "Hamza", message: "Everything is good?", time: "6:10 PM", messagecount: 3),
          ChatTile(name: "Saad ", message: "bye ", time: "2:30 PM", messagecount: 10),
          ChatTile(name: "Hassan ", message: "AZ? ", time: "3:30 PM", messagecount: 1),
          ChatTile(name: "Hashaam ", message: "heyy? ", time: "3:37 PM", messagecount: 2),
          ChatTile(name: "Arslan ", message: "listen..", time: "3:51 PM", messagecount: 2),
          ChatTile(name: "Umer ", message: "wassup? ", time: "4:30 PM", messagecount: 2),
          ChatTile(name: "family ", message: "where are you", time: "12:30 PM", messagecount: 12),
        ],
      ),
    ),

        ], // <-- This was missing!
      ), // <-- This was missing!
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            activeIcon: Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            activeIcon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF128C7E),
      ),
    );
  }
}
class ChatTile extends StatelessWidget {

  
  final String name;
  final String message; 
  final String time;
  final int messagecount;
  
  const ChatTile({super.key, required this.name, required this.message, required this.time, required this.messagecount});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(contactName:name,),),); 
      },
      child: Row(
        children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person),
                  ),
                ),
                
                // Name and Message section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        message,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Time and Message Count section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messagecount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                      ],
      ),
    );
  }
}
