import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.name});
  final String name;
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.name);
  }
}
