import 'package:flutter/material.dart';
import 'package:recipe_demo/features/leading/insiders/home/model/recipe_model.dart';

import '../../../core/core.dart';

class IngredientTable extends StatelessWidget {
  final RecipeModel recipe;
  const IngredientTable({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.wPr(context)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.hPr(context)),
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
                fontSize: 18,
                fontWeight: FWT.medium,
                fontColor: VariableUtilities.theme.darkGray,
              ),
            ),
            SizedBox(height: 12.hPr(context)),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 61.hPr(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 20.wPr(context),
                        child: Text(
                          (index + 1).toString(),
                          style: FontUtilities.style(
                            fontSize: 16,
                            fontColor: VariableUtilities.theme.gray,
                          ),
                        ),
                      ),
                      Checkbox(
                        value: false,
                        activeColor: VariableUtilities.theme.black,
                        onChanged: (v) {},
                      ),
                      SizedBox(width: 10.wPr(context)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.ingredients[index],
                            style: FontUtilities.style(
                              fontSize: 16,
                              fontColor: VariableUtilities.theme.darkGray,
                            ),
                          ),
                          Text(
                            "For lunch",
                            style: FontUtilities.style(
                              fontSize: 12,
                              fontColor: VariableUtilities.theme.gray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
    );
  }
}
