/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */

enum PresentationSessionState
{
  // Existing presentation, and the communication channel is active.
  "connected",

  // Existing presentation, but the communication channel is inactive.
  "disconnected",

  // The presentation is nonexistent anymore. It could be terminated manually,
  // or either requesting page or presenting page is no longer available.
  "terminated"
};

[Constructor(DOMString typeArg,
 optional PresentationSessionStateEventInit eventInitDict),
 Pref="dom.presentation.enabled",
 AvailableIn="PrivilegedApps"]
interface PresentationSessionStateEvent : Event
{
  readonly attribute PresentationSessionState state;
};

dictionary PresentationSessionStateEventInit : EventInit
{
  PresentationSessionState state = "disconnected";
};
