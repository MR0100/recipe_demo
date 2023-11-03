import 'package:flutter/material.dart';
import 'package:recipe_demo/core/core.dart';
import 'package:recipe_demo/features/leading/insiders/home/model/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeDetailsScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VariableUtilities.theme.lightGray,
      appBar: customAppBar(title: 'Recipe Details', context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(recipe.imageUrl),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: const Alignment(0.9, 0.9),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: VariableUtilities.theme.white,
                      ),
                      child: Icon(
                        Icons.share,
                        color: VariableUtilities.theme.darkGray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    recipe.title,
                    style: FontUtilities.style(
                      fontSize: 18,
                      fontWeight: FWT.semiBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: VariableUtilities.theme.darkGray,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        recipe.prepTime,
                        style: FontUtilities.style(
                          fontSize: 14,
                          fontColor: VariableUtilities.theme.darkGray,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.fireplace_rounded,
                        color: VariableUtilities.theme.darkGray,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        recipe.calories,
                        style: FontUtilities.style(
                          fontSize: 14,
                          fontColor: VariableUtilities.theme.darkGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: VariableUtilities.theme.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredients",
                          style: FontUtilities.style(
                            fontSize: 16,
                            fontWeight: FWT.semiBold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: 20,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: FontUtilities.style(
                                      fontSize: 12,
                                      fontColor:
                                          VariableUtilities.theme.darkGray,
                                    ),
                                  ),
                                ),
                                Text(
                                  recipe.ingredients[index],
                                  style: FontUtilities.style(
                                    fontSize: 14,
                                    fontWeight: FWT.medium,
                                    fontColor: VariableUtilities.theme.black,
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: recipe.ingredients.length,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
