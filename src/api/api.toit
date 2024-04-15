// Copyright (C) 2024 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import system.services show ServiceSelector ServiceClient
import ..location show Location

interface LocationService:
  static SELECTOR ::= ServiceSelector
      --uuid="90d66e06-bd35-4759-98af-ecfb9bde22bf"
      --major=1
      --minor=0

  current-location -> Location?
  static CURRENT-LOCATION-INDEX /int ::= 0

class LocationClient extends ServiceClient implements LocationService:
  static SELECTOR ::= LocationService.SELECTOR
  constructor selector/ServiceSelector=SELECTOR:
    assert: selector.matches SELECTOR
    super selector

  current-location -> Location?:
    bytes := invoke_ LocationService.CURRENT-LOCATION-INDEX null
    return bytes and (Location.deserialize bytes)
