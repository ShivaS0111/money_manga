import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manga/config/_colors.dart';
import 'package:money_manga/core/database/table/_repository.dart';
import 'package:provider/provider.dart';

import 'git_search_vm.dart';

class GitSearchVMPage extends StatefulWidget {
  @override
  _GitSearchPageState createState() => _GitSearchPageState();
}

class _GitSearchPageState extends State<GitSearchVMPage> {
  GitSearchViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<GitSearchViewModel>(context, listen: false);
    _viewModel!.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: _listing(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _listing() =>
      Consumer<GitSearchViewModel>(builder: (context, vm, child) {
        if (vm.list.length > 0)
          return ListView.builder(
              itemCount: vm.list.length,
              itemBuilder: (context, i) => _listItem(vm.list[i]));
        else
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text("Loading"),
              ],
            ),
          );
      });

  Widget _listItem(Repository repo) => Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: AppColors.redTransparent,
      child: Text("" +
          (repo.name??'') +
          "(" +
          (repo.language??'') +
          ") by " +
          (repo.username??'') +
          " "
              "\nfollowers:" +
          (repo.followers??0).toString() +
          "\nUrl" +
          (repo.url??'')));
}
