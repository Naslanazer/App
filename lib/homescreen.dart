import 'package:crisisconnect1/complaint.dart';
import 'package:crisisconnect1/customeWidgets/chart.dart';
import 'package:crisisconnect1/emergency.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2B48C), // Beige color
        title: const Center(
          child: Text(
            "CrisisConnect",
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: const Drawer(), // Add navigation drawer here
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Username",
              style: TextStyle(fontSize: 20, color: Colors.brown),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/flood.jpg", // Replace with the path to your asset image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Heavy rainfall expected in the south eastern region.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Current Status:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatusCard(label: "Volunteers", value: "151"),
                _StatusCard(label: "Donations", value: "15k+"),
              ],
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "Check for more updates",
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  ontap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReportIssueScreen()));
                  },
                  icon: Icons.edit,
                  label: "Report \na crisis",
                ),
                _ActionButton(
                   ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmergencyScreen()));
                   },
                  icon: Icons.contacts,
                  label: "Emergency\n contacts",
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Container(child:    CustomProgressChart(),)
          
          ],
        ),
      ),
     
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatusCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Light beige color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final ontap;

  const _ActionButton({required this.icon, required this.label,required  this.ontap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF5F5DC), // Light beige color
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}