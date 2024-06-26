import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/dimensions.dart';
import '../manager/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = context.read<SearchCubit>();
    return TextField(
      controller: searchCubit.searchFieldController,
      onChanged: (value) {
        searchCubit.fetchBooksBySearchQuery(
          isNewSearch: true,
          isDebounce: true,
        );
      },
      onSubmitted: (value) {
        searchCubit.fetchBooksBySearchQuery(isNewSearch: true);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () => searchCubit.fetchBooksBySearchQuery(),
          icon: Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppDimensions.heightCalculator(20),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(AppDimensions.heightCalculator(15)),
    );
  }
}
