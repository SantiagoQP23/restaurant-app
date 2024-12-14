import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/users/presentation/providers/users_providers.dart';

class SelectUserBottomSheet extends ConsumerWidget {
  final User? user;
  final ValueChanged<String> _onTap;
  const SelectUserBottomSheet(
      {super.key, required ValueChanged<String> onTap, this.user})
      : _onTap = onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);
    return usersState.when(
        data: (users) => UsersBottomSheet(
              users: users,
              onTap: _onTap,
              user: user,
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')));
  }
}

class UsersBottomSheet extends ConsumerStatefulWidget {
  final List<User> users;
  final User? user;
  final ValueChanged<String> _onTap;

  const UsersBottomSheet(
      {super.key,
      required this.users,
      required ValueChanged<String> onTap,
      this.user})
      : _onTap = onTap;

  @override
  ConsumerState<UsersBottomSheet> createState() => _UsersBottomSheetState();
}

class _UsersBottomSheetState extends ConsumerState<UsersBottomSheet> {
  String selectedUser = '';

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      selectedUser = widget.user!.id;
    }
  }

  void onChanged(bool? value, User user) {
    if (value != null) {
      if (value == true) {
        setState(() {
          selectedUser = user.id;
        });
      } else {
        setState(() {
          selectedUser = '';
        });
      }
    }
  }

  void updateOrder() {
    final activeOrder = ref.watch(activeOrderProvider);
    if (activeOrder != null) {}
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = widget.user;
    return Container(
        padding: const EdgeInsets.all(10),
        height: 500,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Select user',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(currentUser != null
                ? 'Current user: ${currentUser.person.name} ${currentUser.person.lastName}'
                : 'Select a user'),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.users.length,
                  itemBuilder: (context, index) {
                    final user = widget.users[index];
                    return ListTile(
                        title:
                            Text('${user.person.name} ${user.person.lastName}'),
                        subtitle: Text(user.person.email ?? ''),
                        trailing: Checkbox(
                            value: user.id == selectedUser,
                            onChanged: (value) => onChanged(value, user)));
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget._onTap(selectedUser);
                    context.pop();
                  },
                  child: const Text('Save'),
                )),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent)),
                  child: const Text('Cancel'),
                  onPressed: () => context.pop(),
                ))
          ],
        ));
  }
}
