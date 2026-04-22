import 'package:flutter/material.dart';


class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "THE MEDICINE",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Circle Icon
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF2D9CDB),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            /// Medicines
            Expanded(
              child: ListView(
                children: [

                  medicineCard("OBH Combi", "75ml", "\$9.99"),
                  medicineCard("Betadine", "50ml", "\$6.99"),
                  medicineCard("Panadol", "20pcs", "\$15.99"),
                  medicineCard("Bodrex Herbal", "100ml", "\$7.99"),

                ],
              ),
            ),

            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D9CDB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Add All To Cart",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget medicineCard(String name, String size, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          )
        ],
      ),
      child: Row(
        children: [

          /// Image
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.medication),
          ),

          const SizedBox(width: 12),

          /// Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(size),
              ],
            ),
          ),

          /// Price
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFF2D9CDB),
              fontWeight: FontWeight.bold,
            ),
          )

        ],
      ),
    );
  }
}