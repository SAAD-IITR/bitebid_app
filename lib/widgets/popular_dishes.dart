import 'package:flutter/material.dart';
import 'package:bitebid_app/models/dish.dart';

class PopularDishes extends StatelessWidget {
  const PopularDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Dish> dishes = [
      Dish(
        name: 'Butter Chicken',
        price: 350,
        imageUrl: 'assets/images/butter_chicken.png',
      ),
      Dish(
        name: 'Pizza Margherita',
        price: 250,
        imageUrl: 'assets/images/pizza_margherita.png',
      ),
      Dish(
        name: 'Paneer Tikka',
        price: 280,
        imageUrl: 'assets/images/paneer_tikka.png',
      ),
      Dish(
        name: 'Hakka Noodles',
        price: 220,
        imageUrl: 'assets/images/noodles.png',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Dishes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 2, // 2 hee dishes hai
          itemBuilder: (context, index) {
            return _buildDishCard(dishes[index]);
          },
        ),
      ],
    );
  }

  Widget _buildDishCard(Dish dish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dish image
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(dish.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Dish name
        Text(
          dish.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Dish price
        Text(
          'Starting ₹${dish.price}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
