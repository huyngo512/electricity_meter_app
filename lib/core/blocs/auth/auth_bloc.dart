import 'dart:developer';
import 'dart:io';

import 'package:electricity_meter_app/cache/auth_cache_manager.dart';
import 'package:electricity_meter_app/constants/enums/auth_enum.dart';
import 'package:electricity_meter_app/core/services/auth/interface_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final AuthCacheManager authCacheManager;

  AuthBloc(this.authService, this.authCacheManager)
      : super(const AuthState.unknown()) {
    on<AppStarted>(
      (event, emit) async {
        try {
          if (await authCacheManager.isLoggedIn()) {
            await authCacheManager.updateTokenFromStorage();
            emit(const AuthState.authenticated());
          } else {
            emit((await authCacheManager.isFirstEntry())
                ? const AuthState.firstEntry()
                : const AuthState.guest());
          }
        } on SocketException {
          emit(const AuthState.error(error: AuthError.hostUnreachable));
        } catch (error) {
          log(error.toString());
          emit(const AuthState.error());
        }
      },
    );

    on<LoginRequested>(
      (event, emit) async {
        try {
          final String? response = await authService.login(
              username: event.username, password: event.password);
          if (response != null) {
            print(response);
            await authCacheManager.updateToken(response);
            await authCacheManager.updateLoggedIn(true);
            emit(const AuthState.authenticated());
          }
        } catch (error) {
          add(LogoutRequested());
          emit(const AuthState.error(error: AuthError.wrongUsernameOrPassword));
        }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authCacheManager.signOut();
        emit(const AuthState.guest());
      } catch (_) {}
    });
  }
}
