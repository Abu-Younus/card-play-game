import 'dart:math';

class CardPlay{
  int? _playerScore;
  int? _computerScore;
  int? _tieScore;
  int? _leftCardNumber;
  int? _rightCardNumber;
  int? _totalPlayed;

  CardPlay(
      this._playerScore,
      this._computerScore,
      this._tieScore,
      this._leftCardNumber,
      this._rightCardNumber,
      this._totalPlayed);

  int get playerScore => _playerScore!;

  set playerScore(int value) {
    _playerScore = value;
  }

  int get computerScore => _computerScore!;



  int get tieScore => _tieScore!;

  set tieScore(int value) {
    _tieScore = value;
  }

  int get totalPlayed => _totalPlayed!;

  set totalPlayed(int value) {
    _totalPlayed = value;
  }

  int get rightCardNumber => _rightCardNumber!;

  set rightCardNumber(int value) {
    _rightCardNumber = value;
  }

  int get leftCardNumber => _leftCardNumber!;

  set leftCardNumber(int value) {
    _leftCardNumber = value;
  }

  set computerScore(int value) {
    _computerScore = value;
  }

  void changeCardNumber() {
    _leftCardNumber = Random().nextInt(13) + 2;
    _rightCardNumber = Random().nextInt(13) + 2;
    print('Left Card: $_leftCardNumber');
    print('Right Card: $_rightCardNumber');
  }

  void updateResult() {
    if(_leftCardNumber != _rightCardNumber) {
      if(_leftCardNumber! > _rightCardNumber!) {
        _playerScore = _playerScore! + 1;
      } else {
        _computerScore = _computerScore! + 1;
      }
    } else {
      _tieScore = _tieScore! + 1;
    }
    _totalPlayed = _totalPlayed! + 1;
  }

  void playAgain() {
    _playerScore = 0;
    _computerScore = 0;
    _tieScore = 0;
    _totalPlayed = 0;
    _leftCardNumber = 2;
    _rightCardNumber = 2;
  }
}