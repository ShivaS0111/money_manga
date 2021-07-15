import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manga/config/_colors.dart';
import 'package:money_manga/core/database/table/_repository.dart';

import 'git_bloc.dart';
import 'git_event.dart';
import 'git_state.dart';

class GitSearchBlocPage extends StatefulWidget {
  @override
  _GitSearchPageState createState() => _GitSearchPageState();
}

class _GitSearchPageState extends State<GitSearchBlocPage> {
  GitBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GitBloc();
    _bloc!..add(GitLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc!..add(GitReloadEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _listing({required List<Repository> list}) {
    if (list.length > 0)
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) => _listItem(list[i]));
    else
      return _loader();
  }

  Widget _listItem(Repository repo) => Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: AppColors.redTransparent,
      child:Text("" +
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

  Widget _body() {
    return BlocProvider<GitBloc>(
        create: (context) => _bloc!,
        child: BlocBuilder<GitBloc, GitState>(
            builder: (BuildContext context, GitState state) {
          if (state is GitLoadedState)
            return _listing(list: state.list??[]);
          else if (state is GitLoadingState)
            return _loader();
          else if (state is GitInitialState)
            return Container(child: Center(child: Text("Init screen")));
          else return _listing(list: []);
        }));
  }

  Widget _loader() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text("Loading.."),
          ],
        ),
      );
}
