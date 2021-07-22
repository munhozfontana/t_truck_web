import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

class ExpandedMapComponent extends StatelessWidget {
  final void Function()? onTap;

  const ExpandedMapComponent({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            Get.find<HomeController>().mapEntity.value.map,
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onTap ?? Get.back,
                child: Container(
                  margin: EdgeInsets.all(constraints.maxHeight / 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 50,
                  child: const Icon(
                    Icons.zoom_out_map_rounded,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
