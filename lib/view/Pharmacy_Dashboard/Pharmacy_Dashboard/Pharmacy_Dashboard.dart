
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_size_manager.dart';
import '../../../core/resources/height.dart';
import '../../../core/resources/raduis_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width.dart';
class PharmacyDashboard extends StatelessWidget {
  const PharmacyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      appBar: AppBar(
        title:  Text(
          Utils.pharmacyDashboard,
          style: TextStyle(color: ColorManager.black),
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        iconTheme:  IconThemeData(color: ColorManager.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h20),
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
              children: [

                dashboardCard(Utils.total, Utils.totalOrders, Icons.inventory),
                 dashboardCard(Utils.revenue, Utils.revenueText, Icons.attach_money),
                 dashboardCard(Utils.customers, Utils.customersText, Icons.people),
                 dashboardCard(Utils.medicines, Utils.medicinesText, Icons.medication),

              ],
            ),

            SizedBox(height: HeightManager.h10),

            /// Manage Medicines
            Container(
              padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h20),
              decoration: BoxDecoration(
                color:  ColorManager.primary,
                borderRadius: BorderRadius.circular(RaduisManager.r12),
              ),
              child: Row(
                children: [
                  Icon(Icons.medication, color: ColorManager.white),
                  SizedBox(width: WidthManager.w10),
                   Text(
                    Utils.manageMedicines,
                    style: TextStyle(color: ColorManager.white, fontSize: FontSizeManager.f16),
                  )
                ],
              ),
            ),

            SizedBox(height: HeightManager.h10),

            /// Requests Card
            cardButton(Icons.description, Utils.requests, Utils.pending),

             SizedBox(height: HeightManager.h20),

            /// Recent Orders
            sectionTitle(Utils.recentOrders),

            orderCard(Utils.ord1, Utils.customerName, Utils.pending, Utils.pendingNumber),
            orderCard(Utils.ord2, Utils.bobSmith, Utils.completed, Utils.completedNumber),
            orderCard(Utils.ord3, Utils.carolWhite, Utils.processing, Utils.processingNumber),

             SizedBox(height: HeightManager.h20),

            /// Pending Requests
            sectionTitle(Utils.pendingRequests),

            requestCard(Utils.insulinGlarine, Utils.davidLee),
            requestCard(Utils.hydroxychloroquine, Utils.emmaWilson),
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
      padding:  EdgeInsets.symmetric(horizontal: WidthManager.w15, vertical: HeightManager.h15),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(RaduisManager.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(height: HeightManager.h10),
          Text(
            number,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizeManager.f18,
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
      style:  TextStyle(fontSize: FontSizeManager.f18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget orderCard(String id, String name, String status, String price) {
  Color color;

  if (status == Utils.pending) {
    color = ColorManager.orange;
  } else if (status == Utils.completed) {
    color = ColorManager.green;
  } else {
    color = ColorManager.blue;
  }

  return Card(
    child: ListTile(
      title: Text(id),
      subtitle: Text(name),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:  EdgeInsets.symmetric(horizontal: WidthManager.w10, vertical: HeightManager.h5),
            decoration: BoxDecoration(
              color: color.withOpacity(.2),
              borderRadius: BorderRadius.circular(RaduisManager.r12),
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
      borderRadius: BorderRadius.circular(RaduisManager.r12),
    ),
    child: Row(
      children: [
        Icon(icon),
         SizedBox(width: WidthManager.w10),
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
           SizedBox(height: HeightManager.h10),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.green,
                ),
                onPressed: () {},
                child:  Text(Utils.accept),
              ),
               SizedBox(width: WidthManager.w10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.grey,
                ),
                onPressed: () {},
                child:  Text(Utils.decline),
              ),
            ],
          )
        ],
      ),
    ),
  );
}