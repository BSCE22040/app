import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/sms_verification.dart';

class Contactdetail extends StatelessWidget {
  Contactdetail({super.key});

  final TextEditingController countryCodeController = TextEditingController(text: "+92");
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Verify Your Phone Number",
          style: TextStyle(
            fontSize: 15,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "WhatsApp will send a SMS message to verify your phone number. Enter your security code and phone number.",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20), 
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80,
                child: TextField(
                  controller: countryCodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+92",
                  ),
                ),
              ),
            ),
            SizedBox(width: 2),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Phone No",
                  ),
                ),
              ),
            ),
          ]),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                String fullPhoneNumber = countryCodeController.text + phoneNumberController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SmsVerificationPage(phoneNumber: fullPhoneNumber),
                  ),
                );
              },
              label: Text(
                "Next",
                style: TextStyle(color: Colors.green),
              ),
              icon: Icon(Icons.arrow_forward, color: Colors.green),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
