/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */

[Pref="dom.presentation.enabled", AvailableIn="PrivilegedApps"]
interface PresentationSession : EventTarget {
  /**
   * Unique id for all existing sessions.
   */
  [Constant]
  readonly attribute DOMString id;

  /**
   * @value connected: Use postMessage() to send messages and terminate() to
   *                   close the session. Listen |onmessage| to handle messages.
   * @value disconnected: No operation is allowed at this state.
   */
  readonly attribute PresentationSessionState state;

  /**
   * It is called when session state changes. New value is dispatched with
   * the event.
   */
           attribute EventHandler onstatechange;

  /**
   * This function is useful only if |state == 'connected'|.
   */
  [Throws]
  void postMessage(DOMString data);

  /**
   * This function is useful only if |state == 'connected'|.
   */
  [Throws]
  void terminate();

  /**
   * It is called when receiving messages. 
   */
           attribute EventHandler onmessage;
};
