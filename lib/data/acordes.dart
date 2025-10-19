
final List<String> tons = [
  'C',
  'C#',
  'D',
  'Eb',
  'E',
  'F',
  'F#',
  'G',
  'Ab',
  'A',
  'B',
  'Bb'
];
List<String> obterAcordesDoTom(String tom) {
  switch (tom) {
    case 'C':
      return <String>['C', 'Dm', 'Em', 'F', 'G', 'Am'];
    case 'C#':
      return <String>['C#', 'D#m', 'Fm', 'F#', 'G#', 'A#m'];
    case 'D':
      return <String>['D', 'Em', 'F#m', 'G', 'A', 'Bm'];
    case 'Eb':
      return <String>['Eb', 'Fm', 'Gm', 'Ab', 'Bb', 'Cm'];
    case 'E':
      return <String>['E', 'F#m', 'G#m', 'A', 'B', 'C#m'];
    case 'F':
      return <String>['F', 'Gm', 'Am', 'Bb', 'C', 'Dm'];
    case 'F#':
      return <String>['F#', 'G#m', 'A#m', 'B', 'C#', 'D#m'];
    case 'G':
      return <String>['G', 'Am', 'Bm', 'C', 'D', 'Em'];
    case 'Ab':
      return <String>['Ab', 'Bbm', 'Cm', 'Db', 'Eb', 'Fm'];
    case 'A':
      return <String>['A', 'Bm', 'C#m', 'D', 'E', 'F#m'];
    case 'Bb':
      return <String>['Bb', 'Cm', 'Dm', 'Eb', 'F', 'Gm'];
    case 'B':
      return <String>['B', 'C#m', 'D#m', 'E', 'F#', 'G#m'];
    default:
      return <String>[];
  }
}
