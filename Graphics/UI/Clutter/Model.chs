-- -*-haskell-*-
--  Clutter Model
--
--  Author : Matthew Arsenault
--
--  Created: 6 Oct 2009
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

--TODO: Make it like models in gtk2hs

module Graphics.UI.Clutter.Model (
                                --modelSetNames,
                                --modelSetTypes,

                                  modelGetColumnName,
                                  modelGetColumnType,
                                  modelGetNColumns,
                                  modelNColumns,
                                  modelGetNRows,
                                  modelNRows,
                                --modelAppend,
                                --modelPrepend,
                                --modelInsert,
                                --modelInsertValue,
                                  modelRemove,
                                --modelForeach,
                                  modelSetSortingColumn,
                                  modelGetSortingColumn,
                                  modelSortingColumn,
                                --modelSetSort,
                                  modelResort,
                                --modelSetFilter,
                                  modelGetFilterSet,
                                  modelFilterIter,
                                  modelFilterRow,
                                  modelGetFirstIter,
                                  modelGetLastIter,
                                  modelGetIterAtRow,

                             --ListModel
                                  listModelNew
                                 ) where

{# import Graphics.UI.Clutter.Types #}
{# import Graphics.UI.Clutter.GValue #}

import C2HS
import Control.Monad (liftM)
import System.Glib.Attributes
import System.Glib.GType
import Data.Word
import qualified System.Glib.GTypeConstants as GType

{# fun unsafe model_get_column_name as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `String' #}

{# fun unsafe model_get_column_type as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `GType' cToEnum #}

{# fun unsafe model_get_n_columns as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `Word' cIntConv #}
modelNColumns :: (ModelClass model) => ReadAttr model Word
modelNColumns = readAttr modelGetNColumns

{# fun unsafe model_get_n_rows as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `Word' cIntConv #}
modelNRows :: (ModelClass model) => ReadAttr model Word
modelNRows = readAttr modelGetNRows




{# fun unsafe model_get_sorting_column as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `Word' cIntConv #}
{# fun unsafe model_set_sorting_column as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `()' #}
modelSortingColumn :: (ModelClass model) => Attr model Word
modelSortingColumn = newAttr modelGetSortingColumn modelSetSortingColumn



--CHECKME: unsafe?
{# fun unsafe model_remove as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `()' #}

{# fun unsafe model_resort as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `()' #}

{-
TODO: need the mkModelFilterFunc part
modelSetFilter :: (ModelClass model) => model -> ModelFilterFunc
modelSetFilter model filterFunc = withModelClass model $ \mdlPtr -> do
                                    fFuncPtr <- mkModelFilterFunc
                                    gdestroy <- mkFunPtrDestroyNotify fFuncPtr
                                    --CHECKME: unsafe?
                                    {# call unsafe model_set_filter #} mdpPtr fFuncPtr nullPtr gdestroy
-}

{# fun unsafe model_get_filter_set as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `Bool' #}

{# fun unsafe model_filter_iter as ^
       `(ModelClass model)' => { withModelClass* `model', withModelIter* `ModelIter' } -> `Bool' #}

{# fun unsafe model_filter_row as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `Bool' #}

{# fun unsafe model_get_first_iter as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `ModelIter' newModelIter* #}
{# fun unsafe model_get_last_iter as ^
       `(ModelClass model)' => { withModelClass* `model' } -> `ModelIter' newModelIter* #}
{# fun unsafe model_get_iter_at_row as ^
       `(ModelClass model)' => { withModelClass* `model', cIntConv `Word' } -> `ModelIter' newModelIter* #}



--List Model

listModelNew :: [(GType, String)] -> IO ListModel
listModelNew lst = let (types, names) = unzip lst
                   in withMany withCString names $ \cstrs ->
                       withArrayLen cstrs $ \len namesPtr ->
                       withArray types $ \typesPtr ->
                          newListModel =<< {# call unsafe list_model_newv #} (cIntConv len) typesPtr namesPtr


