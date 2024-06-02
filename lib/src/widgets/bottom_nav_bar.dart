import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/helpers/nav_model.dart';
import 'package:grocery_app/src/utils/constants.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.onItemSelected,
  });

  final Function(NavModel) onItemSelected;

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  NavModel selectBottomNav = Constants.BOTTOM_NAV_ITEMS.first;
  List<NavModel> list = Constants.BOTTOM_NAV_ITEMS;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: Stack(
        children: [
          // Your main content here
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Adjust to position the bar higher or lower
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Adjust to match your design
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0), // Adjust to match your design
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: list.map((element) {
                    final bool isSelected = selectBottomNav == element;
                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.onItemSelected.call(element);
                          setState(() => selectBottomNav = element);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isSelected
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            context.theme.colorScheme.onSurface,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          element.iconName,
                                          height: 25,
                                          width: 25,
                                          colorFilter: ColorFilter.mode(
                                            context.theme.colorScheme.onPrimary,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ))
                                  : SvgPicture.asset(
                                      element.iconName,
                                      height: 25,
                                      width: 25,
                                      colorFilter: ColorFilter.mode(
                                        context.theme.colorScheme.onSurface,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSelectionChanged(int index) =>
      setState(() => selectBottomNav = list[index]);
}
