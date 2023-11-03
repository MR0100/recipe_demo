import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: VariableUtilities.theme.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                      height: 150,
                      width: double.infinity,
                    ),
                    Align(
                      alignment: const Alignment(0.95, 0.9),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: VariableUtilities.theme.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: VariableUtilities.theme.darkGray,
                              size: 12,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              prepTime,
                              style: FontUtilities.style(
                                fontSize: 12,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Text(
                title,
                style: FontUtilities.style(
                  fontSize: 16,
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
