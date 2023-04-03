import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamro_patro/constants/asset_list.dart';
import 'package:hamro_patro/utils/generate_random.dart';
import 'package:hamro_patro/widgets/container_decoration.dart';
import 'package:hamro_patro/widgets/custom_divider.dart';
import 'package:hamro_patro/widgets/widget_space.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SaitScreen extends StatelessWidget {
  const SaitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              AssetList.hamroPatroCover,
              width: size.width,
              height: 120,
              fit: BoxFit.cover,
            ),
            verticalSpace(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowIconWidget(
                  iconData: Icons.temple_hindu_outlined,
                  text: "Horoscope",
                  onPressed: () {
                    log("pressed");
                  },
                ),
                rowIconWidget(
                  iconData: Icons.temple_buddhist_outlined,
                  text: "Janma \n Kundali",
                  onPressed: () {
                    log("pressed");
                  },
                ),
                rowIconWidget(
                  iconData: Icons.church_outlined,
                  text: "Mantra/ \n Bhajan",
                  onPressed: () {
                    log("pressed");
                  },
                ),
              ],
            ),
            verticalSpace(height: 12),
            StickyHeader(
              header: eventHeader(title: "विवाह मुर्हुत"),
              content: Column(
                children: [
                  randomNumberList(name: "BaiShaakh", length: 4),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Maagh", length: 6),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Faalgun", length: 8),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Jeth", length: 5),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Ashaada", length: 2),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Mangsir", length: 12),
                ],
              ),
            ),
            verticalSpace(height: 12),
            StickyHeader(
              header: eventHeader(title: NepaliUnicode.convert("Bratabandha")),
              content: Column(
                children: [
                  randomNumberList(name: "BaiShaakh", length: 1),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Caitra", length: 3),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Faalgun", length: 4),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Magh", length: 2),
                ],
              ),
            ),
            verticalSpace(height: 12),
            StickyHeader(
              header: eventHeader(title: NepaliUnicode.convert("AnnaPrashaasan")),
              content: Column(
                children: [
                  randomNumberList(name: "BaiShaakh", length: 7),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Maagh", length: 4),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Faalgun", length: 8),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Jeth", length: 6),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Ashaada", length: 10),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Mangsir", length: 12),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Kaarthik", length: 6),
                ],
              ),
            ),
            verticalSpace(height: 12),
            StickyHeader(
              header: eventHeader(title: NepaliUnicode.convert("Grahaarambha")),
              content: Column(
                children: [
                  randomNumberList(name: "BaiShaakh", length: 1),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Caitra", length: 3),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Magh", length: 1),
                ],
              ),
            ),
            verticalSpace(height: 12),
            StickyHeader(
              header: eventHeader(title: NepaliUnicode.convert("GrihhaPraves")),
              content: Column(
                children: [
                  randomNumberList(name: "Bhadau", length: 4),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Caitra", length: 2),
                  verticalSpace(height: 10),
                  randomNumberList(name: "Magh", length: 4),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget eventHeader({required String title}) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
  Widget randomNumberList({required String name, required int length}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(width: 10),
          Expanded(
            child: Text(
              NepaliUnicode.convert("$name 2080"),
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          horizontalSpace(width: 20),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 28,
              child: ListView.builder(
                itemCount: RandomGenerator.generateRandomDate(range: length).length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final element =
                      RandomGenerator.generateRandomDate(range: length)[index];
                  return Container(
                    height: 9,
                    width: 32,
                    margin: const EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    decoration: CustomDecoration.customBoxDecoration(
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: Text(
                      NepaliUnicode.convert(element.toString()),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rowIconWidget(
      {required String text,
      required IconData iconData,
      Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.amber,
            size: 50,
          ),
          verticalSpace(),
          Text(
            text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white, fontSize: 12.0, letterSpacing: 0.2),
          )
        ],
      ),
    );
  }
}
