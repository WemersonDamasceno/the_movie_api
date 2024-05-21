import 'package:flutter/material.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController inputController;
  final Function(String value) onSearch;

  const SearchInputWidget({
    Key? key,
    required this.inputController,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextField(
        key: const ValueKey("search-input"),
        controller: inputController,
        cursorColor: Colors.grey,
        style: CustomStyles.styleTitle,
        onChanged: (value) => onSearch(value),
        decoration: const InputDecoration(
          hintText: "Enter the name of the movie.",
          hintStyle: CustomStyles.styleTextSubtitle,
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
