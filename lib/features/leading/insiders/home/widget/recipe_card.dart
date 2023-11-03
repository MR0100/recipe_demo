import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String prepTime;
  final VoidCallback? onTap;
  const RecipeCard(
      {required this.title,
      required this.imageUrl,
      required this.prepTime,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 25.hPr(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: VariableUtilities.theme.white,
          boxShadow: [
            BoxShadow(
              color: VariableUtilities.theme.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: SizedBox(
                height: 150.hPr(context),
                width: double.infinity,
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                      height: 150.hPr(context),
                      width: double.infinity,
                    ),
                    Align(
                      alignment: const Alignment(0.9, 0.8),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.wPr(context),
                          vertical: 6.hPr(context),
                        ),
                        decoration: BoxDecoration(
                          color: VariableUtilities.theme.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AssetUtilities.clockOutlinedSvg,
                              width: 14.wPr(context),
                              height: 14.hPr(context),
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                VariableUtilities.theme.gray,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 4.wPr(context)),
                            Text(
                              prepTime,
                              style: FontUtilities.style(
                                fontSize: 14,
                                fontColor: VariableUtilities.theme.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.wPr(context)),
              child: Text(
                title,
                style: FontUtilities.style(
                  fontSize: 18,
                  fontWeight: FWT.semiBold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
