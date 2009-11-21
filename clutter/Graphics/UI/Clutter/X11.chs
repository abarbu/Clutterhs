-- -*-haskell-*-
--  Clutter X11 Specific stuff
--
--  Author : Matthew Arsenault
--
--  Created: 25 Oct 2009
--
--  Copyright (C) 2009 Matthew Arsenault
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--
{-# LANGUAGE ForeignFunctionInterface  #-}

#include <clutter/clutter.h>
#include <clutter/x11/clutter-x11.h>

{# context lib="clutter" prefix="clutter" #}

-- | X11 Specific Support — X11 specific API
module Graphics.UI.Clutter.X11 (
  x11SetDisplay,
  x11DisableEventRetrieval,
  x11HasEventRetrieval,
  x11GetStageFromWindow,
--x11HandleEvent,
  x11GetDefaultDisplay,
  x11GetDefaultScreen,
  x11GetRootWindow,
--x11GetStageVisual,
  x11GetStageWindow,
  x11SetStageForeign,
  x11TrapXErrors,
  x11UntrapXErrors,
  x11HasCompositeExtension,
  x11GetCurrentEventTime,
--x11AddFilter,
--x11RemoveFilter,
--x11GetInputDevices,
  x11HasXinput,
  x11EnableXinput,
--x11TexturePixmapNew,
--x11TexturePixmapNewWithPixmap,
--x11TexturePixmapNewWithWindow,
--xllTexturePixmapSetPixmap,
--xllTexturePixmapSetWindow,
--x11TexturePixmapSyncWindow,
--x11TexturePixmapUpdateArea,
--x11TexturePixmapSetAutomatic,
  X11FilterReturn(..),
--X11FilterFunc,
  X11XInputEventTypes(..)
--X11TexturePixmap,
--X11TexturePixmapClass
) where

{# import Graphics.UI.Clutter.Types #}

import C2HS
import Graphics.X11
import Graphics.X11.Xlib.Types (Display(..))

{# pointer *Display as DisplayPtr foreign -> Display nocode #}

unDisplay :: Display -> Ptr Display
unDisplay (Display p) = p

{# enum ClutterX11FilterReturn as X11FilterReturn {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterX11XInputEventTypes as X11XInputEventTypes {underscoreToCase} deriving (Show, Eq) #}

--CHECKME: I have no idea if any of this x stuff works
-- | Sets the display connection Clutter should use; must be called
--   before 'clutterInit', 'clutterInitWithArgs' or other functions
--   pertaining Clutter's initialization process.
--
-- [@xdpy@] an X display connection.
--
-- * Since 0.8
--
{# fun unsafe x11_set_display as ^ { unDisplay `Display' } -> `()' #}

-- | Disables retrieval of X events in the main loop. Use to create
--   event-less canvas or in conjunction with
--   'x11HandleEvent'.
--
--  This function can only be called before calling 'clutterInit'.
--
-- * Since 0.8
--
{# fun unsafe x11_disable_event_retrieval as ^ { } -> `()' #}

-- | Queries the X11 backend to check if event collection has been disabled.
--
-- [@Returns@]: @True@ if event retrival has been disabled. @False@ otherwise.
--
-- * Since 0.8
--
{# fun unsafe x11_has_event_retrieval as ^ { } -> `Bool' #}


{# fun unsafe x11_get_stage_from_window as ^ { cIntConv `Window' } -> `Stage' newStage* #}

--{# fun unsafe x11_handle_event as ^ { unXEvent `XEvent' } -> `X11FilterReturn' #}

-- | Retrieves the pointer to the default display.
--
-- [@Returns@] the default display
--
-- * Since 0.6
--
{# fun unsafe x11_get_default_display as ^ { } -> `Display' Display #}


-- | Gets the number of the default X Screen object.
--
-- [@Returns@] the number of the default screen
--
-- * Since 0.6
--
{# fun unsafe x11_get_default_screen as ^ { } -> `Int' #}


-- | Retrieves the root window.
--
-- [@Returns@] the id of the root window
--
-- * Since 0.6
--
{# fun unsafe x11_get_root_window as ^ { } -> `Window' cIntConv #}

{-
not bound in X11?
-- | Returns the stage XVisualInfo
--
-- [@stage@] a 'Stage'
--
-- [@Returns@] The XVisualInfo for the stage.
--
-- * Since 0.4
--
{# fun unsafe x11_get_stage_visual as ^ { withStage* `Stage' } -> `XVisualInfo' #}
-}

-- | Gets the stages X Window.
--
-- [@stage@] a 'Stage'
--
-- [@Returns@] An XID for the stage window.
--
-- * Since 0.4
--
{# fun unsafe x11_get_stage_window as ^ { withStage* `Stage' } -> `Window' cIntConv #}



-- | Target the 'Stage' to use an existing external X Window
--
-- [@stage@] a 'Stage'
--
-- [@xwindow@] an existing X Window id
--
-- [@Returns@] @True@ if foreign window is valid
--
-- * Since 0.4
--
{# fun unsafe x11_set_stage_foreign as ^ { withStage* `Stage', cIntConv `Window' } -> `Bool' #}


-- | Traps every X error until 'x11UntrapXErrors' is called.
--
-- * Since 0.6
--
{# fun unsafe x11_trap_x_errors as ^ { } -> `()' #}

-- | Removes the X error trap and returns the current status.
--
-- [@Returns@] the trapped error code, or 0 for success
--
-- * Since 0.4
--
{# fun unsafe x11_untrap_x_errors as ^ { } -> `Int' #}

{# fun unsafe x11_has_composite_extension as ^ { } -> `Bool' #}

-- | Retrieves the timestamp of the last X11 event processed by
--  Clutter. This might be different from the timestamp returned by
--  'getCurrentEventTime', as Clutter may synthesize or
--  throttle  events.
--
-- * Since 1.0
--

-- | Retrieves the timestamp of the last X11 event processed by
--   Clutter. This might be different from the timestamp returned by
--   'getCurrentEventTime', as Clutter may synthesize or throttle
--   events.
--
-- [@Returns@] a timestamp, in milliseconds
--
-- * Since 1.0
--
{# fun unsafe x11_get_current_event_time as ^ { } -> `Time' cIntConv #}
-- {# fun x11_add_filter
-- {# fun x11_remove_filter

-- {# fun x11_get_input_devices as ^ { } -> `[X11XInputDevice]' readGSList* #}

-- | Gets whether Clutter has XInput support.
--
-- [@Returns@] @True@ if Clutter was compiled with XInput support and XInput support is
--  available at run time.
--
-- * Since 0.8
--
{# fun unsafe x11_has_xinput as ^ { } -> `Bool' #}

-- | Enables the use of the XInput extension if present on connected
--   XServer and support built into Clutter. XInput allows for
--   multiple pointing devices to be used. This must be called before
--  'clutterInit'.
--
-- You should use 'x11HasXinput' to see if support was enabled.
--
-- * Since 0.8
--
{# fun unsafe x11_enable_xinput as ^ { } -> `()' #}


-- {# fun x11_texture_pixmap_new
-- {# fun x11_texture_pixmap_new_with_pixmap
-- {# fun x11_texture_pixmap_new_with_window
-- {# fun x11_texture_pixmap_set_pixmap
-- {# fun x11_texture_pixmap_set_window
-- {# fun x11_texture_pixmap_syn_window

-- {# fun x11_texture_pixmap_update_area
-- {# fun x11_texture_pixmap_set_automatic
