import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CircleAvatar(child: Icon(Icons.person)),
              ElevatedButton(onPressed: () {}, child: Text("Complete KYC"))
            ]),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFE8CFFF),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.deepPurple),
                  SizedBox(width: 14),
                  Expanded(child: Text("Pay via Credit Card\nMake instant vendor and utility payments...", style: TextStyle(fontWeight: FontWeight.bold))),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment),
                  label: Text('Pay'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6A1B9A)),
                ),
                SizedBox(width: 14),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.contacts),
                  label: Text('Contact'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6A1B9A)),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text("Recent Transactions", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(8)),
              child: Text("no transaction made yet"),
            ),
            Text("My Cards", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Card"),
              tileColor: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Refresh"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}