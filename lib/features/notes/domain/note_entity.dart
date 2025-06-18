import 'package:flutter/material.dart';

@immutable
class NoteEntity {
  final DateTime createdAt;
  final String title;
  final String? subtitle;

  const NoteEntity({
    required this.title,
    required this.subtitle,
    required this.createdAt,
  });
}
