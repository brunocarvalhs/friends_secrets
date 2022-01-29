import 'package:flutter/material.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

class ContactTodo extends StatelessWidget {
  final UserModel user;
  final Function(UserModel) onSelect;
  final Function(UserModel) onRemove;
  final bool isSelected;

  const ContactTodo({
    Key? key,
    required this.user,
    required this.onSelect,
    required this.onRemove,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isSelected ? onRemove(user) : onSelect(user),
      child: Card(
        borderOnForeground: true,
        semanticContainer: false,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  )
                : null,
            color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : null,
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${user.photoUrl}"),
                ),
                title: Text("${user.name}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
