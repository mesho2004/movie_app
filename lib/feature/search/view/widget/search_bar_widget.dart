import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/search/view_model/search_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF67686D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        onChanged:onChanged,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: const InputDecoration(
          hintText: "SpiderMan",
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Colors.grey, size: 22),
        ),
      ),
    );
  }
}
