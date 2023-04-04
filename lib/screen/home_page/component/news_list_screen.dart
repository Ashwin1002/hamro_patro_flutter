import 'package:flutter/material.dart';
import 'package:hamro_patro/constants/asset_list.dart';
import 'package:hamro_patro/widgets/widget_space.dart';

import '../../../widgets/container_decoration.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key, required this.title, required this.iconData, required this.iconColor}) : super(key: key);

  final String title;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      decoration: CustomDecoration.customBoxDecoration(
          backgroundColor: Colors.grey.withAlpha(80),
          borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(height: 10),
          CircleAvatar(
            radius: 16,
            backgroundColor: iconColor,
            child: Transform.rotate(
              angle: 5.8,
              child: Icon(
                iconData,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          verticalSpace(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      letterSpacing: 0.4),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
          verticalSpace(height: 6.0),
          const Text(
            "Please read the describes news below",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3),
          ),
          verticalSpace(height: 15.0),
          SizedBox(
            height: 205,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: size.width * 0.6,
                  margin: const EdgeInsets.only(right: 12.0),
                  decoration: CustomDecoration.customBoxDecoration(
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey, width: 0.2),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 85,
                        decoration: CustomDecoration.customBoxDecoration(
                          backgroundColor: Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          decorationImage: const DecorationImage(
                              image: AssetImage(AssetList.hamroPatroCover),
                              fit: BoxFit.cover),
                        ),
                      ),
                      verticalSpace(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          children: [
                            const Text(
                              "Hello, I Love Nepal, Please Visit Nepal 2023. Good life good coffee. Nice hahaha this is good",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            verticalSpace(),
                            Text(
                              "Hello, I Love Nepal, Please Visit Nepal 2023. Good life good coffee. Nice hahaha this is good",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            verticalSpace(),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration:
                                      CustomDecoration.customBoxDecoration(
                                    backgroundColor: Colors.transparent,
                                    shape: BoxShape.circle,
                                    decorationImage: const DecorationImage(
                                        image: AssetImage(
                                            AssetList.hamroPatroCover),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                horizontalSpace(width: 10),
                                const Text(
                                  "Kantipur",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0.5),
                                )
                              ],
                            ),
                            verticalSpace(height: 8.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            width: size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "See All",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      letterSpacing: 0.3),
                ),
                horizontalSpace(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
