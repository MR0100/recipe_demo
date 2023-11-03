import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: 'Home',
        context: context,
        backgroundColor: VariableUtilities.theme.lightGray,
        isBackButton: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chat_bubble_text,
              color: Colors.black,
            ),
          ),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "My Recipe List 1",
                    style: FontUtilities.style(
                      fontSize: 18,
                      fontWeight: FWT.semiBold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
              const SizedBox(height: 16),
              CustomSearchTextField(
                controller: TextEditingController(),
                hintText: 'Search Recipe',
                suffixIcon:
                    const Icon(CupertinoIcons.square_fill_line_vertical_square),
              ),
              const SizedBox(height: 24),
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
