import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_demo/core/core.dart';
import 'package:recipe_demo/features/leading/insiders/home/model/recipe_model.dart';
import 'package:recipe_demo/features/recipe/data/recipe_data.dart';
import 'package:recipe_demo/features/recipe/provider/recipe_provider.dart';
import 'package:recipe_demo/features/recipe/widget/ingredient_table.dart';

import '../../../config/config.dart';

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
              height: 297.hPr(context),
              width: double.infinity,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(recipe.imageUrl),
                    width: double.infinity,
                    height: 297.hPr(context),
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: const Alignment(0.9, 0.9),
                    child: Container(
                      height: 38.hPr(context),
                      width: 38.wPr(context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: VariableUtilities.theme.white,
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: VariableUtilities.theme.white.withOpacity(0.5),
                          width: 3.wPr(context),
                        ),
                      ),
                      child: SvgPicture.asset(
                        AssetUtilities.shareOutlinedSvg,
                        height: 24.hPr(context),
                        width: 24.wPr(context),
                        colorFilter: ColorFilter.mode(
                          VariableUtilities.theme.darkGray,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.hPr(context)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.wPr(context)),
              child: Text(
                recipe.title,
                style: FontUtilities.style(
                  fontSize: 18,
                  fontWeight: FWT.medium,
                  fontColor: VariableUtilities.theme.darkGray,
                ),
              ),
            ),
            SizedBox(height: 16.hPr(context)),
            _tccArea(context),
            SizedBox(height: 16.hPr(context)),
            _categoryList(context),
            SizedBox(height: 16.hPr(context)),
            IngredientTable(recipe: recipe),
            SizedBox(height: 36.hPr(context)),
          ],
        ),
      ),
    );
  }

  Widget _tccArea(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.wPr(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetUtilities.clockOutlinedSvg,
              width: 16.wPr(context),
              height: 16.hPr(context),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                VariableUtilities.theme.gray,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.wPr(context)),
            Text(
              recipe.prepTime,
              style: FontUtilities.style(
                fontSize: 16,
                fontColor: VariableUtilities.theme.darkGray,
              ),
            ),
            SizedBox(width: 16.wPr(context)),
            SvgPicture.asset(
              AssetUtilities.caloriesOutlinedSvg,
              width: 16.wPr(context),
              height: 16.hPr(context),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                VariableUtilities.theme.gray,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.wPr(context)),
            Text(
              recipe.calories,
              style: FontUtilities.style(
                fontSize: 16,
                fontColor: VariableUtilities.theme.darkGray,
              ),
            ),
            const Spacer(),
            Consumer<RecipeProvider>(builder: (context, recipeProvider, child) {
              return Container(
                height: 42.hPr(context),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.hPr(context),
                  vertical: 10.wPr(context),
                ),
                decoration: BoxDecoration(
                  color: VariableUtilities.theme.white,
                  borderRadius: BorderRadius.circular(40.hPr(context)),
                  border: Border.all(
                    color: VariableUtilities.theme.gray.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: recipeProvider.decreaseQty,
                      child: Icon(
                        Icons.remove,
                        color: VariableUtilities.theme.orange,
                      ),
                    ),
                    SizedBox(width: 15.wPr(context)),
                    SizedBox(
                      width: 20.wPr(context),
                      child: Text(
                        recipeProvider.qty.toString(),
                        style: FontUtilities.style(
                          fontSize: 16,
                          fontColor: VariableUtilities.theme.darkGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 15.wPr(context)),
                    GestureDetector(
                      onTap: recipeProvider.increaseQty,
                      child: Icon(
                        Icons.add,
                        color: VariableUtilities.theme.orange,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      );

  Widget _categoryList(BuildContext context) => SizedBox(
        height: 30.hPr(context),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.wPr(context)),
          itemCount: RecipeData.items.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.wPr(context),
                vertical: 6.hPr(context),
              ),
              decoration: BoxDecoration(
                color: VariableUtilities.theme.white,
                borderRadius: BorderRadius.circular(20.hPr(context)),
                border: Border.all(
                  color: VariableUtilities.theme.gray.withOpacity(0.2),
                ),
              ),
              child: Text(
                RecipeData.items[index],
                style: FontUtilities.style(
                  fontSize: 12,
                  fontColor: VariableUtilities.theme.darkGray,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 6.wPr(context));
          },
        ),
      );
}
