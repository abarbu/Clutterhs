-- -*-haskell-*-
{-# LANGUAGE ForeignFunctionInterface #-}

#include <clutter/clutter.h>

{# context lib="clutter" prefix="clutter" #}

module Graphics.UI.Clutter.Types (
                                  Color,
                                  mkColor,
                                  unColor,
                                  withColor,

                                  Actor,
                                  ActorClass,
                                  withActor,
                                  withActorClass,
                                  mkActor,
                                  unActor,
                                  toActor,

                                  Rectangle,
                                  RectangleClass,
                                  toRectangle,
                                  withRectangle,
                                  mkRectangle,
                                  unRectangle,

                                  Stage,
                                  StageClass,
                                  mkStage,
                                  unStage,
                                  withStage,

                                  Container,
                                  ContainerClass,
                                  toContainer,
                                  unContainer,
                                  withContainer,
                                  withContainerClass,

                                  Perspective(Perspective),
                                  PerspectivePtr,
                                  withPerspective,
                                  PickMode(..),
                                  Gravity(..),
                                  RequestMode(..),
                                  ActorFlags(..),
                                  AllocationFlags(..),
                                  RotateAxis(..),

                                  InitError(..)
                                 ) where

import C2HS
import System.Glib.GType (GType, typeInstanceIsA)
import System.Glib.GObject
import Control.Monad (when)
import Foreign.ForeignPtr
import Control.Exception (bracket)

--this doesn't seem to work since GObjectClass is not here...
--I'm not sure if I can work around this. Oh well, I don't think it's that important
--{# pointer *GObject newtype nocode #}
--{# class GObjectClass GObject #}

-- *************************************************************** Misc

{# enum ClutterInitError as InitError {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterPickMode as PickMode {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterAllocationFlags as AllocationFlags {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterGravity as Gravity {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterActorFlags as ActorFlags {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterRequestMode as RequestMode {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterRotateAxis as RotateAxis {underscoreToCase} deriving (Show, Eq) #}

-- ***************************************************************

-- from gtk2hs
-- The usage of foreignPtrToPtr should be safe as the evaluation will only be
-- forced if the object is used afterwards
--
castTo :: (GObjectClass obj, GObjectClass obj') => GType -> String
                                                -> (obj -> obj')
castTo gtype objTypeName obj =
  case toGObject obj of
    gobj@(GObject objFPtr)
      | typeInstanceIsA ((unsafeForeignPtrToPtr.castForeignPtr) objFPtr) gtype
                  -> unsafeCastGObject gobj
      | otherwise -> error $ "Cannot cast object to " ++ objTypeName


-- *************************************************************** Color

{# pointer *ClutterColor as Color foreign newtype #}

instance Show Color where
  show (Color c) = show c

unColor (Color o) = o

manageColor :: Color -> IO ()
manageColor (Color colorForeignPtr) = do
  addForeignPtrFinalizer colorFree colorForeignPtr

foreign import ccall unsafe "&clutter_color_free"
  colorFree :: FinalizerPtr Color

mkColor :: Ptr Color -> IO Color
mkColor colorPtr = do
  colorForeignPtr <- newForeignPtr colorFree colorPtr
  return (Color colorForeignPtr)

{-
--maybe do this like perspective.
instance Storable Color where
  sizeOf _ = {# sizeof ClutterColor #}
  alignment _ = alignment (undefined :: CChar)  --TODO? GUInt8
  peek p = do
      red <- {# get ClutterColor->red #} p
      blue <- {# get ClutterColor->blue #} p
      green <- {# get ClutterColor->green #} p
      alpha <- {# get ClutterColor->alpha #} p
      return $ Color (cIntConv red) (cIntConv blue) (cIntConv green) (cIntConv alpha)

  poke p (Color r b g a) = do
      {# set ClutterColor->r #} p (cIntConv fovy)   --FIXME: cIntConv is wrong.
      {# set ClutterColor->b #} p (cIntConv aspect)
      {# set ClutterColor->g #} p (cIntConv z_near)
      {# set ClutterColor->a #} p (cIntConv z_far)
      return ()
-}

{-
gtk skips this ginitiallyunowned stuff...seems useless anyway
{# pointer *GInitiallyUnowned as GInitiallyUnowned foreign newtype #}

--first attempt at class such stuff.

--class GInitiallyUnowned ???

mkGInitiallyUnowned = GInitiallyUnowned
unGInitiallyUnowned (GInitiallyUnowned o) = o
-}

-- *************************************************************** Actor

{# pointer *ClutterActor as Actor foreign newtype #}
--{# class GObjectClass => ActorClass Actor #}

mkActor = Actor
unActor (Actor a) = a

class GObjectClass o => ActorClass o
toActor::ActorClass o => o -> Actor
toActor = unsafeCastGObject . toGObject
withActorClass::ActorClass o => o -> (Ptr Actor -> IO b) -> IO b
withActorClass o = (withActor . toActor) o

instance ActorClass Actor
instance GObjectClass Actor where
  toGObject = mkGObject . castForeignPtr . unActor
  unsafeCastGObject = mkActor . castForeignPtr . unGObject

{- -- doesn't exist?
castToActor :: GObjectClass obj => obj -> Actor
castToActor = castTo gTypeActor "Actor"

gTypeActor = {# call fun unsafe clutter_actor_get_type #}
-}

--class GObjectClass o => ObjectClass o
--toObject :: ObjectClass o => o -> Object
--toObject = unsafeCastGObject . toGObject

--class GInitiallyUnownedClass o => ActorClass o

-- ***************************************************************

-- *************************************************************** Rectangle

{# pointer *ClutterRectangle as Rectangle foreign newtype #}

mkRectangle = Rectangle
unRectangle (Rectangle a) = a

class GObjectClass o => RectangleClass o
toRectangle::RectangleClass o => o -> Rectangle
toRectangle = unsafeCastGObject . toGObject

instance RectangleClass Rectangle
instance ActorClass Rectangle
instance GObjectClass Rectangle where
  toGObject = mkGObject . castForeignPtr . unRectangle
  unsafeCastGObject = mkRectangle . castForeignPtr . unGObject


-- ***************************************************************

-- *************************************************************** Group

{#pointer *ClutterGroup as Group foreign newtype #}

class ActorClass o => GroupClass o
toGroup :: GroupClass o => o -> Group
toGroup = unsafeCastGObject . toGObject

mkGroup = Group
unGroup (Group o) = o

instance GroupClass Group
instance ContainerClass Group
instance ActorClass Group
instance GObjectClass Group where
  toGObject = mkGObject . castForeignPtr . unGroup
  unsafeCastGObject = mkGroup . castForeignPtr . unGObject

-- *************************************************************** Group

-- *************************************************************** Container

{# pointer *ClutterContainer as Container foreign newtype #}

mkContainer = Container
unContainer (Container o) = o

class GObjectClass o => ContainerClass o
toContainer :: ContainerClass o => o -> Container
toContainer = unsafeCastGObject . toGObject

withContainerClass::ContainerClass o => o -> (Ptr Container -> IO b) -> IO b
withContainerClass o = (withContainer . toContainer) o

instance ContainerClass Container
instance GObjectClass Container where
  toGObject = mkGObject . castForeignPtr . unContainer
  unsafeCastGObject = mkContainer . castForeignPtr . unGObject

-- ***************************************************************


-- *************************************************************** Stage

{# pointer *ClutterStage as Stage foreign newtype #}

class GroupClass o => StageClass o
toStage :: StageClass o => o -> Stage
toStage = unsafeCastGObject . toGObject

mkStage = Stage
unStage (Stage o) = o

{-
mkStage :: Ptr Stage -> IO Stage
mkStage stagePtr = do
  stageForeignPtr <- newForeignPtr_ stagePtr
  return (Stage stageForeignPtr)

manageStage :: Stage -> IO ()
manageStage (Stage stageForeignPtr) = do
  addForeignPtrFinalizer stageDestroy stageForeignPtr
-}

instance StageClass Stage
instance ContainerClass Stage
instance GroupClass Stage
instance ActorClass Stage
instance GObjectClass Stage where
  toGObject = mkGObject . castForeignPtr . unStage
  unsafeCastGObject = mkStage . castForeignPtr . unGObject

-- ***************************************************************

-- *************************************************************** Perspective

--FIXME: How to marshal this?
data Perspective = Perspective {
      perspectiveFovy :: !Float,
      perspectiveAspect :: !Float,
      perspectiveZNear :: !Float,
      perspectiveZFar :: !Float
    } deriving (Show, Eq)

{# pointer *ClutterPerspective as PerspectivePtr -> Perspective #}

instance Storable Perspective where
  sizeOf _ = {# sizeof ClutterPerspective #}
  alignment _ = alignment (undefined :: CFloat)
  peek p = do
      fovy <- {# get ClutterPerspective->fovy #} p
      aspect <- {# get ClutterPerspective->aspect #} p
      z_near <- {# get ClutterPerspective->z_near #} p
      z_far <- {# get ClutterPerspective->z_far #} p
      return $ Perspective (cFloatConv fovy) (cFloatConv aspect) (cFloatConv z_near) (cFloatConv z_far)

  poke p (Perspective fovy aspect z_near z_far) = do
      {# set ClutterPerspective->fovy #} p (cFloatConv fovy)
      {# set ClutterPerspective->aspect #} p (cFloatConv aspect)
      {# set ClutterPerspective->z_near #} p (cFloatConv z_near)
      {# set ClutterPerspective->z_far #} p (cFloatConv z_far)
      return ()

--This seems not right. But it seems to work.
mkPerspective :: Perspective -> IO PerspectivePtr
mkPerspective pst = do pptr <- (malloc :: IO PerspectivePtr)
                       poke pptr pst
                       return pptr

withPerspective :: Perspective -> (PerspectivePtr -> IO a) -> IO a
withPerspective pst = bracket (mkPerspective pst) free

-- ***************************************************************

