import 'package:bloc/bloc.dart';
import 'package:bloc_api_call/data/api_service.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<GetDataEvent>((event, emit) async{
      try{
        emit(ApiLoading());
        String data = await getData(key:event.key);
        emit(ApiSuccess(data));
      }catch(e){
        emit(ApiFail(e.toString()));
      }
    });
  }
}
