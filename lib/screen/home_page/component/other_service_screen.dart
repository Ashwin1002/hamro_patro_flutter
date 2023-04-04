import 'package:flutter/material.dart';

import '../../../constants/asset_list.dart';
import '../../../widgets/container_decoration.dart';
import '../../../widgets/widget_space.dart';

class OtherServiceScreen extends StatelessWidget {
  const OtherServiceScreen({Key? key}) : super(key: key);

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
            backgroundColor: Colors.purple.shade400,
            child: Transform.scale(
              scale: 1,
              child: const Icon(
                Icons.apps,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          verticalSpace(height: 10),
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Other Services",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      letterSpacing: 0.4),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
          verticalSpace(height: 6.0),
          const Text(
            "Services in our apps",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3),
          ),
          verticalSpace(height: 15.0),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: size.width * 0.22,
                  margin: const EdgeInsets.only(right: 12.0),
                  decoration: CustomDecoration.customBoxDecoration(
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey, width: 0.2),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 75,
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child:  Text(
                          "Hamro Pay",
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpace(height: 10)
        ],
      ),
    );
  }
}
