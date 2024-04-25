import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/enums/routes_path_enum.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        RoutesPathEnum.search.name,
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search for a movie",
                style: CustomStyles.stylePercentText,
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Text(
                  "Enter the name of the movie.",
                  style: CustomStyles.styleTextSubtitle.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
