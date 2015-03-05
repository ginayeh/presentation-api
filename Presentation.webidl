/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */

[Pref="dom.presentation.enabled", AvailableIn="PrivilegedApps"]
interface Presentation : EventTarget {
  [Throws]
  Promise<PresentationSession> startSession(DOMString url, optional DOMString sessionId);

  /*
   * No prompt is popped up.
   */
  [Throws]
  Promise<PresentationSession> joinSession(DOMString url, DOMString sessionId);

  /**
   * This attribute is only available on the presenting page. It should be
   * created when loading the presenting page, and it's ready to be used after
   * 'onload' event is dispatched. 
   */
  readonly attribute PresentationSession? session;

 /*
  * Device availability. If there are more than one available devices, the
  * value is |true|. Otherwise, its value should be |false|.
  * 
  * UA triggers device discovery mechanism periodically and cache the latest
  * result in this attribute. Thus, it may be out-of-date when we're not in
  * discovery mode, however, it is still useful to give the developers an idea
  * that whether there are devices nearby some time ago.
  */
           attribute boolean cachedAvailable;

  /**
   * It is called when device availability changes. New value is dispatched with
   * the event.
   */
           attribute EventHandler onavailablechange;
};
