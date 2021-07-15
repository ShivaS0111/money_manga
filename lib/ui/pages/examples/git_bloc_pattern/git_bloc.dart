import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:money_manga/core/repository/git_repository.dart';

import 'git_event.dart';
import 'git_state.dart';

class GitBloc extends Bloc<GitEvent, GitState> {

  final GitRepository _gitRepository = Get.find<GitRepository>();

  GitBloc() :super(GitInitialState());

  @override
  Stream<GitState> mapEventToState(GitEvent event) async* {
    print('===> $event    $state');
    if (event is GitLoadedEvent) {
      if (state is GitInitialState) {
        yield GitLoadingState();

        final resp = await _gitRepository.getSearch('flutter');

        yield GitLoadedState(list:resp.data );
      } else if (state is GitLoadedState) {
        yield state;
      }
    }else if( event is GitReloadEvent){
      if (state is GitInitialState) {
        yield GitLoadingState();
        yield GitLoadedState(list:[] );
      } else if (state is GitLoadedState) {
        yield state;
      }
    }
  }
}