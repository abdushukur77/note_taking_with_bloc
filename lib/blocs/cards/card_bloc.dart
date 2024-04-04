import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_event.dart';
import 'card_state.dart';


class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc()
      : super(
          CardState(
            name: "",
            cardNumber: "",
            cardHolder: "",
            expireDate: "",
          ),
        ) {
    on<CardInsertNameEvent>(_insertName);
    on<CardInsertExpireDateEvent>(_insertExpireDate);
    on<CardInsertHolderNameEvent>(_insertHolderName);
    on<CardInsertNumberEvent>(_insertNumber);
    on<CardSetEmptyEvent>(_setEmpty);
  }

  _insertName(CardInsertNameEvent event, Emitter<CardState> emit) {
    emit(state.copyWith(name: event.name));
  }

  _insertExpireDate(CardInsertExpireDateEvent event, Emitter<CardState> emit) {
    emit(state.copyWith(expireDate: event.cardExpireDate));
  }

  _insertHolderName(CardInsertHolderNameEvent event, Emitter<CardState> emit) {
    emit(state.copyWith(cardHolder: event.cardHolder));
  }

  _insertNumber(CardInsertNumberEvent event, Emitter<CardState> emit) {
    emit(state.copyWith(cardNumber: event.cardNumber));
  }

  _setEmpty(CardSetEmptyEvent event, Emitter<CardState> emit) {
    emit(CardState(name: "", cardNumber: "", cardHolder: "", expireDate: ""));
  }
}
