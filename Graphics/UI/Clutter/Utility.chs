-- -*-haskell-*-
--  Stuff used internally
--
--  Author : Matthew Arsenault
--
--  Created: 23 Oct 2009
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

{# context lib="clutter" prefix="clutter" #}

module Graphics.UI.Clutter.Utility (
                                    tup2ToF,
                                    tup3ToF,
                                    tup4ToF
                                   ) where

{# import Graphics.UI.Clutter.Types #}

import C2HS
import Control.Monad (liftM)
import System.Glib.Attributes

--There's Probably a better way to do this I'm using this for related
--attributes that you might want to set at once rather than
--separately, e.g. instead of setting X position and Y position, set
--position (X,Y) at the same time
tup2ToF f item (a,b) = f item a b
tup3ToF f item (a,b,c) = f item a b c
tup4ToF f item (a,b,c,d) = f item a b c d


