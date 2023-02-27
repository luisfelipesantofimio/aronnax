import 'dart:developer';

import 'package:aronnax/src/domain/entities/todo.dart';
import 'package:aronnax/src/presentation/widgets/todos_list_view/todos_filter_element.dart';
import 'package:flutter/material.dart';

class TodosFilterItem extends StatefulWidget {
  const TodosFilterItem({
    required this.categoryList,
    required this.onCategorySelected,
    Key? key,
  }) : super(key: key);
  final List<Todo> categoryList;
  final Function(String) onCategorySelected;

  @override
  State<TodosFilterItem> createState() => _TodosFilterItemState();
}

class _TodosFilterItemState extends State<TodosFilterItem> {
  List<String> categoriesList = [];
  @override
  void initState() {
    log(widget.categoryList.map((e) => e.catergory!).toList().toString());
    log(categoriesList.toString());
    List<String> rawList =
        widget.categoryList.map((e) => e.catergory!).toList();
    for (var element in rawList) {
      List<String> items = element.split(',');
      for (var element in items) {
        categoriesList.add(element);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoriesList.length,
      itemBuilder: (context, index) => TodosFilterElement(
        title: categoriesList.elementAt(index),
        onTap: widget.onCategorySelected(
          categoriesList.elementAt(index),
        ),
      ),
    );
  }
}
