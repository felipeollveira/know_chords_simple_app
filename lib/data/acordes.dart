
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
      return ['C', 'Dm', 'Em', 'F', 'G', 'Am'];
    case 'C#':
      return ['C#', 'D#m', 'Fm', 'F#', 'G#', 'A#m'];
    case 'D':
      return ['D', 'Em', 'F#m', 'G', 'A', 'Bm'];
    case 'Eb':
      return ['Eb', 'Fm', 'Gm', 'Ab', 'Bb', 'Cm'];
    case 'E':
      return ['E', 'F#m', 'G#m', 'A', 'B', 'C#m'];
    case 'F':
      return ['F', 'Gm', 'Am', 'Bb', 'C', 'Dm'];
    case 'F#':
      return ['F#', 'G#m', 'A#m', 'B', 'C#', 'D#m'];
    case 'G':
      return ['G', 'Am', 'Bm', 'C', 'D', 'Em'];
    case 'Ab':
      return ['Ab', 'Bbm', 'Cm', 'Db', 'Eb', 'Fm'];
    case 'A':
      return ['A', 'Bm', 'C#m', 'D', 'E', 'F#m'];
    case 'Bb':
      return ['Bb', 'Cm', 'Dm', 'Eb', 'F', 'Gm'];
    case 'B':
      return ['B', 'C#m', 'D#m', 'E', 'F#', 'G#m'];
    default:
      return [];
  }
}