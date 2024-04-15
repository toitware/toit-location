// Copyright (C) 2021 Toitware ApS. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be found
// in the LICENSE file.

import location show Location
import expect show *

main:
  l1 := Location 10.21437 56.15900
  expect-equals 10.21437 l1.latitude
  expect-equals 56.15900 l1.longitude
  expect-equals "10.21437N, 56.15900E" l1.stringify

  l2 := Location -10.21437 56.15900
  expect-equals -10.21437 l2.latitude
  expect-equals 56.15900 l2.longitude
  expect-equals "10.21437S, 56.15900E" l2.stringify

  l3 := Location 10.21437 -56.15900
  expect-equals 10.21437 l3.latitude
  expect-equals -56.15900 l3.longitude
  expect-equals "10.21437N, 56.15900W" l3.stringify

  l4 := Location -10.21437 -56.15900
  expect-equals -10.21437 l4.latitude
  expect-equals -56.15900 l4.longitude
  expect-equals "10.21437S, 56.15900W" l4.stringify

  expect l1 == l1
  expect l2 == l2
  expect l1 != l2
  expect l1.hash-code == l1.hash-code
