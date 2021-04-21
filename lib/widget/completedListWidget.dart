import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/todoWidget.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? Center(
            child: Text(
              'No To Do\'s',
              style: TextStyle(
                  fontSize: 20,
                  //fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Colors.orange),
            ),
          )
        : ListView.separated(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(16),
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, color: Theme.of(context).primaryColor),
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
