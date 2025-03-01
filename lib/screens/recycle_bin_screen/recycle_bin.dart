import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/tasks_list.dart';
import '../tabs/widgets/my_drawer.dart';

class RecycleBin extends StatelessWidget {
  // ignore: use_super_parameters
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Delete all tasks'),
                            ),
                            onTap: (){ context
                                .read<TasksBloc>()
                                .add(DeleteAllTasks());
                            context
                                .read<TasksBloc>()
                                .add(GetAllTasks());
                            }),
                      ])
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
