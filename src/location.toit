// Copyright (C) 2019 Toitware ApS. All rights reserved.

import serialization

/**
A location in a geographical coordinate system.
A location is comprised of a latitude and a longitude.
*/

/**
A location in a geographical coordinate system.
A location is comprised of a latitude and a longitude.
*/
class Location:
  /** The latitude. */
  latitude/float
  /** The longitude. */
  longitude/float

  /** Constructs a location with the given $latitude and $longitude. */
  constructor .latitude/float .longitude/float:

  /**
  Constructs a location from the given bytes.

  This is the inverse of $to_byte_array.
  */
  constructor.deserialize bytes/ByteArray:
    values := serialization.deserialize bytes
    latitude = values[0]
    longitude = values[1]

  /** See $super. */
  stringify:
    return "$(component_string_ latitude "N" "S"), $(component_string_ longitude "E" "W")"

  /**
  Serializes this location.

  Produces valid input to $Location.deserialize.
  */
  to_byte_array:
    return serialization.serialize [latitude, longitude]

  component_string_ value/float positive/string negative/string -> string:
    return "$(%3.5f value.abs)$(value >= 0 ? positive : negative)"

  /** See $super. */
  operator == other:
    if other is not Location: return false
    other as Location
    return latitude == other.latitude and longitude == other.longitude

  /** The hash code of this location. */
  hash_code -> int:
    return latitude.bits * 13 + longitude.bits * 17
