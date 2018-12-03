class Music {
  String artistId;
  String artistName;
  String collectionName;
  String trackName;
  String artistViewUrl;
  String trackViewUrl;
  String artworkUrl100;

  Music({
    this.artistId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.artistViewUrl,
    this.trackViewUrl,
    this.artworkUrl100,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      artistId: json['artistId'] as String,
      artistName: json['artistName'] as String,
      collectionName: json['collectionName'] as String,
      trackName: json['trackName'] as String,
      artistViewUrl: json['artistViewUrl'] as String,
      trackViewUrl: json['trackViewUrl'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
    );
  }
}

/* {"wrapperType":"track",                                                                                                                   */
/*   "kind":"song",                                                                                                                          */
/*   "artistId":"15885",                                                                                                                     */
/*   "collectionId":530454022,                                                                                                               */
/*   "trackId":"530454024",                                                                                                                  */
/*   "artistName":"アッシャー",                                                                                                         */
/*   "collectionName":"Looking 4 Myself",                                                                                                    */
/*   "trackName":"Scream",                                                                                                                   */
/*   "collectionCensoredName":"Looking 4 Myself",                                                                                            */
/*   "trackCensoredName":"Scream",                                                                                                           */
/*   "artistViewUrl":"https://itunes.apple.com/jp/artist/%E3%82%A2%E3%83%83%E3%82%B7%E3%83%A3%E3%83%BC/15885?uo=4",                          */
/*   "collectionViewUrl":"https://itunes.apple.com/jp/album/scream/530454022?i=530454024&uo=4",                                              */
/*   "trackViewUrl":"https://itunes.apple.com/jp/album/scream/530454022?i=530454024&uo=4",                                                   */
/*   "previewUrl":"https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music/3c/48/71/mzm.ntyhnldo.aac.p.m4a",                     */
/*   "artworkUrl30":"https://is5-ssl.mzstatic.com/image/thumb/Music/v4/12/ee/be/12eebe2d-e03b-7e49-8266-eb742e60922b/source/30x30bb.jpg",    */
/*   "artworkUrl60":"https://is5-ssl.mzstatic.com/image/thumb/Music/v4/12/ee/be/12eebe2d-e03b-7e49-8266-eb742e60922b/source/60x60bb.jpg",    */
/*   "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Music/v4/12/ee/be/12eebe2d-e03b-7e49-8266-eb742e60922b/source/100x100bb.jpg", */
/*   "collectionPrice":1600.00,                                                                                                              */
/*   "trackPrice":200.00,                                                                                                                    */
/*   "releaseDate":"2012-04-27T07:00:00Z",                                                                                                   */
/*   "collectionExplicitness":"cleaned",                                                                                                     */
/*   "trackExplicitness":"notExplicit",                                                                                                      */
/*   "discCount":1,                                                                                                                          */
/*   "discNumber":1,                                                                                                                         */
/*   "trackCount":19,                                                                                                                        */
/*   "trackNumber":2,                                                                                                                        */
/*   "trackTimeMillis":234693,                                                                                                               */
/*   "country":"JPN",                                                                                                                        */
/*   "currency":"JPY",                                                                                                                       */
/*   "primaryGenreName":"R&B／ソウル",                                                                                                   */
/*   "isStreamable":true                                                                                                                     */
/* },                                                                                                                                        */
