-- -*-haskell-*-
--  Clutter BehaviourEllipse
--
--  Author : Matthew Arsenault
--
--  Created: 3 Oct 2009
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
{-# LANGUAGE ForeignFunctionInterface #-}

#include <clutter/clutter.h>

{# context lib="clutter" prefix="clutter" #}

-- | BehaviourEllipse — A behaviour interpolating position along an
-- ellipse
module Graphics.UI.Clutter.BehaviourEllipse (
-- * Class Hierarchy
-- |
-- @
-- |  'GObject'
-- |    +----'Behaviour'
-- |           +----BehaviourEllipse
-- |
-- @

-- * Types
  BehaviourEllipse,
  BehaviourEllipseClass,

-- * Constructors
  behaviourEllipseNew,

-- * Methods
  behaviourEllipseSetCenter,
  behaviourEllipseGetCenter,

  behaviourEllipseSetAngleStart,
  behaviourEllipseGetAngleStart,
  behaviourEllipseSetAngleEnd,
  behaviourEllipseGetAngleEnd,

  behaviourEllipseSetAngleTilt,
  behaviourEllipseGetAngleTilt,

  behaviourEllipseSetHeight,
  behaviourEllipseGetHeight,

  behaviourEllipseSetWidth,
  behaviourEllipseGetWidth,

  behaviourEllipseSetTilt,
  behaviourEllipseGetTilt,
  behaviourEllipseSetDirection,
  behaviourEllipseGetDirection,

-- * Attributes
  behaviourEllipseAngleEnd,
  behaviourEllipseAngleStart,
  behaviourEllipseAngleTiltX,
  behaviourEllipseAngleTiltY,
  behaviourEllipseAngleTiltZ,
  behaviourEllipseCenter,
  behaviourEllipseDirection,
  behaviourEllipseHeight,
  behaviourEllipseWidth
  ) where

{# import Graphics.UI.Clutter.Enums #}
{# import Graphics.UI.Clutter.Types #}
{# import Graphics.UI.Clutter.Utility #}

import C2HS
import System.Glib.Attributes
import System.Glib.Properties

-- | Creates a behaviour that drives actors along an elliptical path
--   with given center, width and height; the movement starts at start
--   degrees (with 0 corresponding to 12 o'clock) and ends at end
--   degrees. Angles greated than 360 degrees get clamped to the
--   canonical interval <0, 360); if start is equal to end, the
--   behaviour will rotate by exacly 360 degrees.
--
-- [@alpha@] @Just@ an 'Alpha', or @Nothing@
--
-- [@x@] x coordinates of the center
--
-- [@y@] y coordinates of the center
--
-- [@width@] width of the ellipse
--
-- [@height@] height of the ellipse
--
-- [@direction@] 'RotateDirection' of rotation
--
-- [@start@] angle in degrees at which movement starts, between 0 and 360
--
-- [@end@] angle in degrees at which movement ends, between 0 and 360
--
-- [@Returns@] the newly created 'BehaviourEllipse'
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_new as ^
       { withMaybeAlpha* `Maybe Alpha',
         `Int',
         `Int',
         `Int',
         `Int',
         cFromEnum `RotateDirection',
         `Double',
         `Double'
         } -> `BehaviourEllipse' newBehaviourEllipse* #}

-- | Sets the center of the elliptical path to the point represented by knot.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@x@] x coordinate of the center
--
-- [@y@] y coordinate of the center
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_set_center as ^
       { withBehaviourEllipse* `BehaviourEllipse', `Int', `Int' } -> `()' #}


-- | Gets the center of the elliptical path path.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] (X coordinate of the center, Y coordinate of the center)
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_center as ^
       { withBehaviourEllipse* `BehaviourEllipse',
         alloca- `Int' peekIntConv*,
         alloca- `Int' peekIntConv* } -> `()' #}


-- | Sets the angle at which movement starts; angles \>= 360 degress
--   get clamped to the canonical interval <0, 360).
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@angle_start@] angle at which movement starts in degrees, between 0 and 360.
--
-- * Since 0.6
--
{# fun unsafe behaviour_ellipse_set_angle_start as ^
       { withBehaviourEllipse* `BehaviourEllipse', `Double' } -> `()' #}

-- | Gets the angle at which movements starts.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] angle in degrees
--
-- * Since 0.6
{# fun unsafe behaviour_ellipse_get_angle_start as ^
       { withBehaviourEllipse* `BehaviourEllipse' } -> `Double' #}

-- | Sets the angle at which movement ends; angles \>= 360 degress get
--   clamped to the canonical interval <0, 360).
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@angle_end@] angle at which movement ends in degrees, between 0 and 360.
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_set_angle_end as ^
       { withBehaviourEllipse* `BehaviourEllipse', `Double' } -> `()' #}

-- | Gets the at which movements ends.
--
-- [@self@] a 'BehaviourEllipse
--
-- [@Returns@] angle in degrees
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_angle_end as ^
       { withBehaviourEllipse* `BehaviourEllipse' } -> `Double' #}

-- | Sets the angle at which the ellipse should be tilted around it's
--   center.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@axis@] a 'RotateAxis'
--
-- [@angle_tilt@] tilt of the elipse around the center in the given axis in degrees.
--
-- * Since 0.4
{# fun unsafe behaviour_ellipse_set_angle_tilt as ^
       { withBehaviourEllipse* `BehaviourEllipse', cFromEnum `RotateAxis', `Double' } -> `()' #}

-- | Gets the tilt of the ellipse around the center in the given axis.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@axis@] a 'RotateAxis'
--
-- [@Returns@] angle in degrees.
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_angle_tilt as ^
       { withBehaviourEllipse* `BehaviourEllipse', cFromEnum `RotateAxis' } -> `Double' #}

-- | Sets the height of the elliptical path.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@height@] height of the ellipse
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_set_height as ^
       { withBehaviourEllipse* `BehaviourEllipse', `Int' } -> `()' #}

-- | Gets the height of the elliptical path.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] the height of the path
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_height as ^
       { withBehaviourEllipse* `BehaviourEllipse' } -> `Int' #}


-- | Sets the width of the elliptical path.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@width@] width of the ellipse
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_set_width as ^
       { withBehaviourEllipse* `BehaviourEllipse', `Int' } -> `()' #}

-- | Gets the width of the elliptical path.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] the width of the path
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_width as ^
       { withBehaviourEllipse* `BehaviourEllipse' } -> `Int' #}


-- | Sets the angles at which the ellipse should be tilted around it's
--   center.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@angle_tilt_x@] tilt of the ellipse around the center in X axis in
-- degrees.
--
-- [@angle_tilt_y@] tilt of the ellipse around the center in Y axis in
-- degrees.
--
-- [@angle_tilt_z@] tilt of the ellipse around the center in Z axis in degrees.
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_set_tilt as ^
       { withBehaviourEllipse* `BehaviourEllipse',
       `Double',
       `Double',
       `Double' } -> `()' #}


-- | Gets the tilt of the ellipse around the center in Y axis.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] (tilt angle on the X axis, tilt angle on the Y axis,
-- tilt angle on the Z axis)
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_tilt as ^
       { withBehaviourEllipse* `BehaviourEllipse',
         alloca- `Double' peekFloatConv* ,
         alloca- `Double' peekFloatConv*,
         alloca- `Double' peekFloatConv*
       } -> `()' #}


-- | Sets the rotation direction used by the ellipse behaviour.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@direction@] the rotation direction
--
-- * Since 0.4
{# fun unsafe behaviour_ellipse_set_direction as ^
       { withBehaviourEllipse* `BehaviourEllipse', cFromEnum `RotateDirection' } -> `()' #}

-- | Retrieves the 'RotateDirection' used by the ellipse behaviour.
--
-- [@self@] a 'BehaviourEllipse'
--
-- [@Returns@] the rotation direction
--
-- * Since 0.4
--
{# fun unsafe behaviour_ellipse_get_direction as ^
       { withBehaviourEllipse* `BehaviourEllipse' } -> `RotateDirection' cToEnum #}

-- Attributes


-- | The final angle to where the rotation should end.
--
-- Allowed values: [0,360]
--
-- Default value: 0
--
-- * Since 0.4
--
behaviourEllipseAngleEnd :: Attr BehaviourEllipse Double
behaviourEllipseAngleEnd = newNamedAttr "angle-end" behaviourEllipseGetAngleEnd behaviourEllipseSetAngleEnd


-- | The initial angle from where the rotation should start.
--
-- Allowed values: [0,360]
--
-- Default value: 0
--
-- * Since 0.4
--
behaviourEllipseAngleStart :: Attr BehaviourEllipse Double
behaviourEllipseAngleStart = newNamedAttr "angle-start" behaviourEllipseGetAngleStart behaviourEllipseSetAngleStart


-- | The tilt angle for the rotation around center in X axis
--
-- Allowed values: [0,360]
--
-- Default value: 360
--
-- * Since 0.4
--
behaviourEllipseAngleTiltX :: Attr BehaviourEllipse Double
behaviourEllipseAngleTiltX = newAttrFromDoubleProperty "angle-tilt-x"


-- | The tilt angle for the rotation around center in Y axis
--
-- Allowed values: [0,360]
--
-- Default value: 360
--
-- * Since 0.4
--
behaviourEllipseAngleTiltY :: Attr BehaviourEllipse Double
behaviourEllipseAngleTiltY = newAttrFromDoubleProperty "angle-tilt-y"


-- | The tilt angle for the rotation on the Z axis
--
-- Allowed values: [0,360]
--
-- Default value: 360
--
-- * Since 0.4
--
behaviourEllipseAngleTiltZ :: Attr BehaviourEllipse Double
behaviourEllipseAngleTiltZ = newAttrFromDoubleProperty "angle-tilt-z"

-- | The center of the ellipse.
--
-- * Since 0.4
--
behaviourEllipseCenter :: Attr BehaviourEllipse Knot
behaviourEllipseCenter = newNamedAttr "center" behaviourEllipseGetCenter (uncurry . behaviourEllipseSetCenter)



-- | The direction of the rotation.
--
-- Default value: 'RotateCw'
--
-- * Since 0.4
--
behaviourEllipseDirection :: Attr BehaviourEllipse RotateDirection
behaviourEllipseDirection = newNamedAttr "direction" behaviourEllipseGetDirection behaviourEllipseSetDirection


-- | Height of the ellipse, in pixels
--
-- Allowed values: >= 0
--
-- Default value: 50
--
-- * Since 0.4
--
behaviourEllipseHeight :: Attr BehaviourEllipse Int
behaviourEllipseHeight = newNamedAttr "height" behaviourEllipseGetHeight behaviourEllipseSetHeight

-- | Width of the ellipse, in pixels
--
-- Allowed values: >= 0
--
-- Default value: 100
--
-- * Since 0.4
--
behaviourEllipseWidth :: Attr BehaviourEllipse Int
behaviourEllipseWidth = newNamedAttr "width" behaviourEllipseGetWidth behaviourEllipseSetWidth


