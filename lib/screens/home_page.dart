import 'package:flutter/material.dart';
import 'package:bitebid_app/widgets/budget_slider.dart';
import 'package:bitebid_app/widgets/cuisine_filter.dart';
import 'package:bitebid_app/widgets/dietary_tags.dart';
import 'package:bitebid_app/widgets/location_header.dart';
import 'package:bitebid_app/widgets/popular_dishes.dart';
import 'package:bitebid_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Location Vala function
                LocationHeader(),

                SizedBox(height: 24),

                Text(
                  'What would you like to eat?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 16),

                CustomSearchBar(),

                SizedBox(height: 24),

                BudgetSlider(),

                SizedBox(height: 24),

                CuisineFilter(),

                SizedBox(height: 16),

                DietaryTags(),

                SizedBox(height: 24),

                PopularDishes(),

                SizedBox(height: 24),

                FindDealButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FindDealButton extends StatelessWidget {
  const FindDealButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6E21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Find My Best Deal',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
