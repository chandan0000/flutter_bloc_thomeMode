import 'dart:developer';
 

import 'package:bloc/bloc.dart';
import 'package:darkmode/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc()
      : super(AppThemeState(theme: AppTheme.lightTheme, isTrue: false)) {
    on<AppThemeEvent>((event, emit) {
      if (event is AppThemeEvent) {
        emit(AppThemeState(theme: event.theme, isTrue: event.isTrue));
        log('dark mode');
      }
    });
  }
}
