import 'package:flutter/material.dart';

class CuisineFilter extends StatefulWidget {
  const CuisineFilter({Key? key}) : super(key: key);

  @override
  State<CuisineFilter> createState() => _CuisineFilterState();
}

class _CuisineFilterState extends State<CuisineFilter> {
  int _selectedIndex = 0;
  final List<String> _cuisines = ['All Cuisines', 'Indian', 'Chinese', 'Italian'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cuisines.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? const Color(0xFFFF6E21)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _selectedIndex == index
                      ? const Color(0xFFFF6E21)
                      : Colors.grey[300]!,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                _cuisines[index],
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
