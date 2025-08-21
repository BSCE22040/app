import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/homepage.dart';

class SmsVerificationPage extends StatelessWidget {
  final String phoneNumber;

  const SmsVerificationPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Verification Code"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "We have sent a verification code to $phoneNumber",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter SMS Code",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                // Later you can verify the code here
              },
              child: Text("Verify"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
