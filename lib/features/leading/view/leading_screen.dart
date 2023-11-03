import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_demo/core/core.dart';
import 'package:recipe_demo/features/leading/data/leading_data.dart';
import 'package:recipe_demo/features/leading/provider/leading_provider.dart';

import '../../../config/config.dart';

class LeadingScreen extends StatefulWidget {
  int? index;
  LeadingScreen({this.index, super.key});

  @override
  State<LeadingScreen> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  late LeadingProvider _leadingProvider;
  @override
  void initState() {
    _leadingProvider = Provider.of<LeadingProvider>(context, listen: false);
    _leadingProvider.onInit(widget.index ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VariableUtilities.theme.lightGray,
      body: Consumer<LeadingProvider>(
        builder: (context, leadingProvider, child) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: LeadingData.pages.length,
            controller: leadingProvider.pageController,
            itemBuilder: (context, index) => LeadingData.pages[index],
          );
        },
      ),
      bottomNavigationBar:
          Consumer<LeadingProvider>(builder: (context, leadingProvider, child) {
        return Container(
          height: 80.hPr(context),
          width: double.infinity,
          decoration: BoxDecoration(
            color: VariableUtilities.theme.white,
            boxShadow: [
              BoxShadow(
                color: VariableUtilities.theme.black.withOpacity(0.1),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              LeadingData.items.length,
              (index) {
                bool isSelected = leadingProvider.selectedPageIndex ==
                    LeadingData.items[index].index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      leadingProvider.changeIndex(index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.hPr(context),
                              horizontal: 20.wPr(context),
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? VariableUtilities.theme.blue
                                      .withOpacity(0.2)
                                  : null,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SvgPicture.asset(
                              LeadingData.items[index].icon,
                              height: 24.hPr(context),
                              width: 24.wPr(context),
                              colorFilter: ColorFilter.mode(
                                isSelected
                                    ? VariableUtilities.theme.blue
                                    : VariableUtilities.theme.gray,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(height: 3.hPr(context)),
                          Text(
                            LeadingData.items[index].title,
                            style: FontUtilities.style(
                              fontSize: 12,
                              fontColor: isSelected
                                  ? VariableUtilities.theme.blue
                                  : VariableUtilities.theme.gray,
                            ),
                          ),
                          SizedBox(height: 20.hPr(context)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
