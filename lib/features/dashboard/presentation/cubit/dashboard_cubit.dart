import 'package:bloc/bloc.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(1);

  void setPage(int newPage) {
    emit(newPage);
  }
}
