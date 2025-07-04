import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/snacks_repo.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'seeallsnacks_state.dart';

class SeeallsnacksCubit extends Cubit<SeeallsnacksState> {
  final String type;
  SeeallsnacksCubit({required this.type}) : super(SeeallsnacksInitial());
    int? selectedFilter = 0;
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallSnacksFilterSelected(selectindex: filterindex));
  }
   String searchQuery = '';
  int currentPage = 0;
  bool isFetching = false;
  bool hasMore = true;
  bool loadedOnce = false;
  List<Datumsnack> snacks = [];
  
  Future<void> getsnacks() async {
    if (isFetching || !hasMore) return;
    isFetching = true;
    
    if (currentPage == 0) {
      emit(Seeallsnackloading());
    }

    try {
      final response = await GetIt.I.get<Getsnacks>().getalsnacks(
        type: type,
        searchQuery: searchQuery,
        pageIndex: currentPage,
        pageSize: 10,
       
      );

      if (response.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
         DataStore.instance.deleateUserId();
         DataStore.instance.deleateFirstNameUser();

        emit(Seeallsnacklerror(message: response.message!));
      } else if(response.message == 'No Internet Connection') {
          emit(Seeallsnacklerror(message: response.message!));
      } else if (response.data != null) {
        if (currentPage == 0) {
          snacks = response.data!;
        } else {
          snacks.addAll(response.data!);
        }

        hasMore = response.data!.length == 10;
        currentPage++;
        loadedOnce = true;
        emit(SeeallsnackAccept(snacks: snacks));
        
      } else {
        emit(Seeallsnacklerror(message: response.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(Seeallsnacklerror(message: 'Error: ${e.toString()}'));
      loadedOnce = true;
    } finally {
      isFetching = false;
    }
  }

  void searchsnacks(String query) {
    searchQuery = query;
    currentPage = 0;
    hasMore = true;
    snacks.clear();
    emit(Seeallsnackloading());
    getsnacks();
  }

  void clearSearch() {
    searchQuery = '';
    currentPage = 0;
    hasMore = true;
    snacks.clear();
    emit(Seeallsnackloading());
    getsnacks();
  }
}

