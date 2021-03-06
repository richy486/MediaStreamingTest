// Copyright 2013 Google Inc.

#import <GoogleCast/GCKDefines.h>

#import <Foundation/Foundation.h>

#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define GCKMediaMetadataClass NSClassFromString(@"GCKMediaMetadata")
#endif

@class GCKImage;

/**
 * @file GCKMediaMetadata.h
 * GCKMediaMetadataType enum.
 */

GCK_ASSUME_NONNULL_BEGIN

/**
 * @enum GCKMediaMetadataType
 * Enum defining the media metadata types.
 */
typedef NS_ENUM(NSInteger, GCKMediaMetadataType) {
  /**  A media type representing generic media content. */
  GCKMediaMetadataTypeGeneric = 0,
  /** A media type representing a movie. */
  GCKMediaMetadataTypeMovie = 1,
  /** A media type representing an TV show. */
  GCKMediaMetadataTypeTVShow = 2,
  /** A media type representing a music track. */
  GCKMediaMetadataTypeMusicTrack = 3,
  /** A media type representing a photo. */
  GCKMediaMetadataTypePhoto = 4,
  /** The smallest media type value that can be assigned for application-defined media types. */
  GCKMediaMetadataTypeUser = 100,
};

/**
 * String key: Creation date.
 *
 * The value is the date and/or time at which the media was created, in ISO-8601 format.
 * For example, this could be the date and time at which a photograph was taken or a piece of
 * music was recorded.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyCreationDate GCK_EXTERN_NSSTRING(kGCKMetadataKeyCreationDate)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyCreationDate;
#endif

/**
 * String key: Release date.
 *
 * The value is the date and/or time at which the media was released, in ISO-8601 format.
 * For example, this could be the date that a movie or music album was released.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyReleaseDate GCK_EXTERN_NSSTRING(kGCKMetadataKeyReleaseDate)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyReleaseDate;
#endif
/**
 * String key: Broadcast date.
 *
 * The value is the date and/or time at which the media was first broadcast, in ISO-8601 format.
 * For example, this could be the date that a TV show episode was first aired.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyBroadcastDate GCK_EXTERN_NSSTRING(kGCKMetadataKeyBroadcastDate)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyBroadcastDate;
#endif

/**
 * String key: Title.
 *
 * The title of the media. For example, this could be the title of a song, movie, or TV show
 * episode. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyTitle GCK_EXTERN_NSSTRING(kGCKMetadataKeyTitle)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyTitle;
#endif

/**
 * String key: Subtitle.
 *
 * The subtitle of the media. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeySubtitle GCK_EXTERN_NSSTRING(kGCKMetadataKeySubtitle)
#else
GCK_EXTERN NSString *const kGCKMetadataKeySubtitle;
#endif

/**
 * String key: Artist.
 *
 * The name of the artist who created the media. For example, this could be the name of a
 * musician, performer, or photographer. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyArtist GCK_EXTERN_NSSTRING(kGCKMetadataKeyArtist)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyArtist;
#endif

/**
 * String key: Album artist.
 *
 * The name of the artist who produced an album. For example, in compilation albums such as DJ
 * mixes, the album artist is not necessarily the same as the artist(s) of the individual songs
 * on the album. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyAlbumArtist GCK_EXTERN_NSSTRING(kGCKMetadataKeyAlbumArtist)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyAlbumArtist;
#endif

/**
 * String key: Album title.
 *
 * The title of the album that a music track belongs to. This value is suitable for display
 * purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyAlbumTitle GCK_EXTERN_NSSTRING(kGCKMetadataKeyAlbumTitle)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyAlbumTitle;
#endif

/**
 * String key: Composer.
 *
 * The name of the composer of a music track. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyComposer GCK_EXTERN_NSSTRING(kGCKMetadataKeyComposer)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyComposer;
#endif

/**
 * Integer key: Disc number.
 *
 * The disc number (counting from 1) that a music track belongs to in a multi-disc album.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyDiscNumber GCK_EXTERN_NSSTRING(kGCKMetadataKeyDiscNumber)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyDiscNumber;
#endif

/**
 * Integer key: Track number.
 *
 * The track number of a music track on an album disc. Typically track numbers are counted
 * starting from 1, however this value may be 0 if it is a "hidden track" at the beginning of
 * an album.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyTrackNumber GCK_EXTERN_NSSTRING(kGCKMetadataKeyTrackNumber)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyTrackNumber;
#endif

/**
 * Integer key: Season number.
 *
 * The season number that a TV show episode belongs to. Typically season numbers are counted
 * starting from 1, however this value may be 0 if it is a "pilot" episode that predates the
 * official start of a TV series.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeySeasonNumber GCK_EXTERN_NSSTRING(kGCKMetadataKeySeasonNumber)
#else
GCK_EXTERN NSString *const kGCKMetadataKeySeasonNumber;
#endif

/**
 * Integer key: Episode number.
 *
 * The number of an episode in a given season of a TV show. Typically episode numbers are
 * counted starting from 1, however this value may be 0 if it is a "pilot" episode that is not
 * considered to be an official episode of the first season.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyEpisodeNumber GCK_EXTERN_NSSTRING(kGCKMetadataKeyEpisodeNumber)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyEpisodeNumber;
#endif

/**
 * String key: Series title.
 *
 * The name of a series. For example, this could be the name of a TV show or series of related
 * music albums. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeySeriesTitle GCK_EXTERN_NSSTRING(kGCKMetadataKeySeriesTitle)
#else
GCK_EXTERN NSString *const kGCKMetadataKeySeriesTitle;
#endif

/**
 * String key: Studio.
 *
 * The name of a recording studio that produced a piece of media. For example, this could be
 * the name of a movie studio or music label. This value is suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyStudio GCK_EXTERN_NSSTRING(kGCKMetadataKeyStudio)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyStudio;
#endif

/**
 * Integer key: Width.
 *
 * The width of a piece of media, in pixels. This would typically be used for providing the
 * dimensions of a photograph.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyWidth GCK_EXTERN_NSSTRING(kGCKMetadataKeyWidth)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyWidth;
#endif

/**
 * Integer key: Height.
 *
 * The height of a piece of media, in pixels. This would typically be used for providing the
 * dimensions of a photograph.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyHeight GCK_EXTERN_NSSTRING(kGCKMetadataKeyHeight)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyHeight;
#endif

/**
 * String key: Location name.
 *
 * The name of a location where a piece of media was created. For example, this could be the
 * location of a photograph or the principal filming location of a movie. This value is
 * suitable for display purposes.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyLocationName GCK_EXTERN_NSSTRING(kGCKMetadataKeyLocationName)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyLocationName;
#endif

/**
 * Double key: Location latitude.
 *
 * The latitude component of the geographical location where a piece of media was created.
 * For example, this could be the location of a photograph or the principal filming location of
 * a movie.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyLocationLatitude GCK_EXTERN_NSSTRING(kGCKMetadataKeyLocationLatitude)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyLocationLatitude;
#endif

/**
 * Double key: Location longitude.
 *
 * The longitude component of the geographical location where a piece of media was created.
 * For example, this could be the location of a photograph or the principal filming location of
 * a movie.
 *
 * @memberof GCKMediaMetadata
 */
#ifdef USE_CAST_DYNAMIC_FRAMEWORK
#define kGCKMetadataKeyLocationLongitude GCK_EXTERN_NSSTRING(kGCKMetadataKeyLocationLongitude)
#else
GCK_EXTERN NSString *const kGCKMetadataKeyLocationLongitude;
#endif

/**
 * A container for media metadata. Metadata has a media type, an optional list of images, and a
 * collection of metadata fields. Keys for common metadata fields are predefined as constants, but
 * the application is free to define and use additional fields of its own.
 *
 * The values of the predefined fields have predefined types. For example, a track number is
 * an <code>NSInteger</code> and a creation date is an
 * <a href="https://goo.gl/5dXzU6"><b>NSString</b></a> containing an ISO-8601 representation of a
 * date and time. Attempting to store a value of an incorrect type in a field will raise an
 * <a href="https://goo.gl/xvv9VM"><b>NSInvalidArgumentException</b></a>.
 *
 * Note that the Cast protocol limits which metadata fields can be used for a given media type.
 * When a MediaMetadata object is serialized to JSON for delivery to a Cast receiver, any
 * predefined fields which are not supported for a given media type will not be included in the
 * serialized form, but any application-defined fields will always be included.
 * The complete list of predefined fields is as follows:
 *
 * <table>
 *   <tr>
 *     <th>Field</th>
 *     <th>Value Type</th>
 *     <th>Valid Metadata Types</th>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyCreationDate</td>
 *     <td><a href="https://goo.gl/LWeYFJ"><b>NSDate</b></a></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyReleaseDate</td>
 *     <td><a href="https://goo.gl/LWeYFJ"><b>NSDate</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeGeneric, @ref GCKMediaMetadataTypeMovie,
 *         @ref GCKMediaMetadataTypeTVShow, @ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyBroadcastDate</td>
 *     <td><a href="https://goo.gl/LWeYFJ"><b>NSDate</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeTVShow</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyTitle</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeGeneric, @ref GCKMediaMetadataTypeMovie,
 *         @ref GCKMediaMetadataTypeTVShow, @ref GCKMediaMetadataTypeMusicTrack,
 *         @ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeySubtitle</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeGeneric, @ref GCKMediaMetadataTypeMovie</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyArtist</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeGeneric, @ref GCKMediaMetadataTypeMusicTrack,
 *         @ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyAlbumArtist</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyAlbumTitle</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyComposer</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyDiscNumber</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyTrackNumber</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMusicTrack</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeySeasonNumber</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeTVShow</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyEpisodeNumber</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeTVShow</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeySeriesTitle</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeTVShow</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyStudio</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypeMovie</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyWidth</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyHeight</td>
 *     <td><a href="https://goo.gl/hQFeav"><b>NSInteger</b></a></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyLocationName</td>
 *     <td><a href="https://goo.gl/5dXzU6"><b>NSString</b></a></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyLocationLatitude</td>
 *     <td><b>double</b></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 *   <tr>
 *     <td>@ref kGCKMetadataKeyLocationLongitude</td>
 *     <td><b>double</b></td>
 *     <td>@ref GCKMediaMetadataTypePhoto</td>
 *   </tr>
 * </table>
 */
GCK_EXPORT
@interface GCKMediaMetadata : NSObject <NSCopying>

/**
 * The metadata type.
 */
@property(nonatomic, assign, readonly) GCKMediaMetadataType metadataType;

/**
 * Initializes a new, empty, MediaMetadata with the given media type.
 * Designated initializer.
 *
 * @param metadataType The media type; one of the @ref GCKMediaMetadataType constants, or a
 * value greater than or equal to @ref GCKMediaMetadataTypeUser for custom media types.
 */
- (instancetype)initWithMetadataType:(GCKMediaMetadataType)metadataType;

/**
 * Initialize with the generic metadata type.
 */
- (instancetype)init;

/**
 * The metadata type.
 */
- (GCKMediaMetadataType)metadataType;

/**
 * Gets the list of images.
 */
- (NSArray *)images;

/**
 * Removes all the current images.
 */
- (void)removeAllMediaImages;

/**
 * Adds an image to the list of images.
 *
 * @param image The image to add.
 */
- (void)addImage:(GCKImage *)image;

/**
 * Tests if the object contains a field with the given key.
 *
 * @param key The key.
 * @return <code>YES</code> if the field exists, <code>NO</code> otherwise.
 */
- (BOOL)containsKey:(NSString *)key;

/**
 * Returns a set of keys for all fields that are present in the object.
 */
- (NSArray<NSString *> *)allKeys;

/**
 * Reads the value of a field.
 *
 * @param key The key for the field.
 * @return The value of the field, or <code>nil</code> if the field has not been set.
 */
- (id GCK_NULLABLE_TYPE)objectForKey:(NSString *)key;

/**
 * Stores a value in a string field.
 *
 * @param value The new value for the field.
 * @param key The key for the field.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a string
 * field.
 */
- (void)setString:(NSString *)value forKey:(NSString *)key;

/**
 * Reads the value of a string field.
 *
 * @param key The key for the field.
 * @return The value of the field, or <code>nil</code> if the field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a string
 * field.
 */
- (NSString *GCK_NULLABLE_TYPE)stringForKey:(NSString *)key;

/**
 * Stores a value in an integer field.
 *
 * @param value The new value for the field.
 * @param key The key for the field.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not an integer
 * field.
 */
- (void)setInteger:(NSInteger)value forKey:(NSString *)key;

/**
 * Reads the value of an integer field.
 *
 * @param key The key for the field.
 * @return The value of the field, or 0 if the field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not an integer
 * field.
 */
- (NSInteger)integerForKey:(NSString *)key;

/**
 * Reads the value of an integer field.
 *
 * @param key The key for the field.
 * @param defaultValue The value to return if the field has not been set.
 * @return The value of the field, or the given default value if the field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not an integer
 * field.
 */
- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

/**
 * Stores a value in a <b>double</b> field.
 *
 * @param value The new value for the field.
 * @param key The key for the field.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a
 * <b>double</b> field.
 */
- (void)setDouble:(double)value forKey:(NSString *)key;

/**
 * Reads the value of a <b>double</b> field.
 *
 * @param key The key for the field.
 * @return The value of the field, or 0 if the field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a
 * <b>double</b> field.
 */
- (double)doubleForKey:(NSString *)key;

/**
 * Reads the value of a <b>double</b> field.
 *
 * @param defaultValue The value to return if the field has not been set.
 * @param key The key for the field.
 * @return The value of the field, or the given default value if the field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a
 * <b>double</b> field.
 */
- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue;

/**
 * Stores a value in a date field as a restricted ISO-8601 representation of the date.
 *
 * @param date The new value for the field.
 * @param key The key for the field.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a date
 * field.
 */
- (void)setDate:(NSDate *)date forKey:(NSString *)key;

/**
 * Reads the value of a date field from the restricted ISO-8601 representation of the date.
 *
 * @param key The field name.
 * @return The date, or <code>nil</code> if this field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a date
 * field.
 */
- (NSDate *GCK_NULLABLE_TYPE)dateForKey:(NSString *)key;

/**
 * Reads the value of a date field, as a string.
 *
 * @param key The field name.
 * @return The date as a string containing the restricted ISO-8601 representation of the date, or
 * <code>nil</code> if this field has not been set.
 * @throw NSInvalidArgumentException if the key refers to a predefined field which is not a date
 * field.
 */
- (NSString *GCK_NULLABLE_TYPE)dateAsStringForKey:(NSString *)key;

@end

GCK_ASSUME_NONNULL_END
