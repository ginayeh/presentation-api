/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 */

[Pref="dom.presentation.enabled", AvailableIn="PrivilegedApps"]
interface PresentationSession : EventTarget {
  /*
   * Unique id for all existing sessions.
   */
  [Constant]
  readonly attribute DOMString id;

  /*
   * Please refer to PresentationSessionStateEvent.webidl for the declaration of
   * PresentationSessionState.
   *
   * @value "connected", "disconnected", or "terminated".
   */
  readonly attribute PresentationSessionState state;

  /*
   * It is called when session state changes. New state is dispatched with the
   * event.
   */
           attribute EventHandler onstatechange;

  /*
   * After a communication channel has been established between the requesting
   * page and the presenting page, postMessage() is called to send message to
   * the other side, and the event handler "onmessage" will be invoked on the
   * remote side.
   *
   * This function only works when state equals "connected".
   *
   * @data: String literal-only for current implementation.
   */
  [Throws]
  void postMessage(DOMString data);

  /*
   * It is triggered when receiving messages.
   */
           attribute EventHandler onmessage;

  /*
   * Both the requesting page and the presenting page can close the session by
   * calling terminate(). Then, the session is destroyed and its state is
   * truned into "terminated". After getting into the state of "terminated",
   * joinSession() is incapable of re-establishing the connection.
   *
   * This function does nothing if the state has already been "terminated".
   */
  [Throws]
  void terminate();
};
