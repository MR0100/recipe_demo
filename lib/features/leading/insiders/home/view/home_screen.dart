import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_demo/config/config.dart';
import 'package:recipe_demo/core/core.dart';
import 'package:recipe_demo/features/leading/insiders/home/data/home_data.dart';
import 'package:recipe_demo/features/leading/insiders/home/widget/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VariableUtilities.theme.lightGray,
      appBar: customAppBar(
        title: 'Favorites',
        context: context,
        backgroundColor: VariableUtilities.theme.lightGray,
        isBackButton: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.wPr(context)),
            child: SvgPicture.asset(
              AssetUtilities.chatBubbleOutlinedSvg,
              height: 24.hPr(context),
              width: 24.wPr(context),
              colorFilter: ColorFilter.mode(
                VariableUtilities.theme.darkGray,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.hPr(context)),
              const SizedBox(height: 16),
              CustomSearchTextField(
                controller: TextEditingController(),
                hintText: 'Search Recipe',
                suffixIcon: SvgPicture.asset(
                  AssetUtilities.filterOutlinedSvg,
                  height: 24.hPr(context),
                  width: 24.wPr(context),
                  colorFilter: ColorFilter.mode(
                    VariableUtilities.theme.darkGray,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: 24.hPr(context)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => RecipeCard(
                  title: HomeData.items[index].title,
                  imageUrl: HomeData.items[index].imageUrl,
                  prepTime: HomeData.items[index].prepTime,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteConfig.recipeDetailsScreen,
                      arguments: HomeData.items[index],
                    );
                  },
                ),
                itemCount: HomeData.items.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
