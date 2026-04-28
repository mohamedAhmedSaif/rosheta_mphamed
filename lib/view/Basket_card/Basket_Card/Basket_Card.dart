import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_size_manager.dart';
import '../../../core/resources/height.dart';
import '../../../core/resources/raduis_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width.dart';


class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        title:  Text(
          Utils.medicineName,
          style: TextStyle(color: ColorManager.black),
        ),
        iconTheme:  IconThemeData(color: ColorManager.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Circle Icon
            Container(
              height: HeightManager.h100,
              width: WidthManager.w100,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.check,
                color: ColorManager.white,
                size: FontSizeManager.f50,
              ),
            ),

            SizedBox(height: HeightManager.h20),

            /// Medicines
            Expanded(
              child: ListView(
                children: [

                  medicineCard(Utils.obhCombi, Utils.ml75, Utils.p999),
                  medicineCard(Utils.betadine, Utils.ml50, Utils.p699),
                  medicineCard(Utils.panadol, Utils.pcs20, Utils.p1599),
                  medicineCard(Utils.bodrexHerbal, Utils.ml100, Utils.p799),

                ],
              ),
            ),

            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  ColorManager.primary,
                  padding:  EdgeInsets.symmetric(vertical: HeightManager.h10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RaduisManager.r12),
                  ),
                ),
                onPressed: () {},
                child:  Text(
                 Utils.addAllToCart,
                  style: TextStyle(fontSize: FontSizeManager.f16),
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
        borderRadius: BorderRadius.circular(RaduisManager.r12),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: ColorManager.black12,
          )
        ],
      ),
      child: Row(
        children: [

          /// Image
          Container(
            height: HeightManager.h60,
            width: WidthManager.w60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(RaduisManager.r10),
            ),
            child: const Icon(Icons.medication),
          ),

           SizedBox(width: WidthManager.w10),

          /// Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeManager.f16,
                  ),
                ),
                Text(size),
              ],
            ),
          ),

          /// Price
          Text(
            price,
            style:  TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          )

        ],
      ),
    );
  }
}