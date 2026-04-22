import 'package:flutter/material.dart';

class PharmacyDashboard extends StatelessWidget {
  const PharmacyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      appBar: AppBar(
        title: const Text(
          "Pharmacy Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Top Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: const [

                dashboardCard("156", "Total Orders", Icons.inventory),
                dashboardCard("\$8,450", "Revenue", Icons.attach_money),
                dashboardCard("1,234", "Customers", Icons.people),
                dashboardCard("342", "Medicines", Icons.medication),

              ],
            ),

            const SizedBox(height: 12),

            /// Manage Medicines
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff1C7C6D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.medication, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Manage Medicines",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// Requests Card
            cardButton(Icons.description, "Requests", "2 Pending"),

            const SizedBox(height: 20),

            /// Recent Orders
            sectionTitle("Recent Orders"),

            orderCard("ORD-001", "Alice Brown", "Pending", "\$45.50"),
            orderCard("ORD-002", "Bob Smith", "Completed", "\$28.00"),
            orderCard("ORD-003", "Carol White", "Processing", "\$67.80"),

            const SizedBox(height: 20),

            /// Pending Requests
            sectionTitle("Pending Requests"),

            requestCard("Insulin Glargine", "David Lee"),
            requestCard("Hydroxychloroquine", "Emma Wilson"),
          ],
        ),
      ),
    );
  }
}

class dashboardCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;

  const dashboardCard(this.number, this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(height: 10),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

Widget sectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget orderCard(String id, String name, String status, String price) {
  Color color;

  if (status == "Pending") {
    color = Colors.orange;
  } else if (status == "Completed") {
    color = Colors.green;
  } else {
    color = Colors.blue;
  }

  return Card(
    child: ListTile(
      title: Text(id),
      subtitle: Text(name),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(color: color),
            ),
          ),
          Text(price),
        ],
      ),
    ),
  );
}

Widget cardButton(IconData icon, String title, String subtitle) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        )
      ],
    ),
  );
}

Widget requestCard(String medicine, String user) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicine,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(user),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child: const Text("Accept"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {},
                child: const Text("Decline"),
              ),
            ],
          )
        ],
      ),
    ),
  );
}