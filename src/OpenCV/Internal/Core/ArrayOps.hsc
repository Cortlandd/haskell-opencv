module OpenCV.Internal.Core.ArrayOps
    ( NormType(..)
    , NormAbsRel(..)
    , marshalNormType
    )
    where

import "base" Data.Bits ( (.|.) )
import "base" Data.Int

--------------------------------------------------------------------------------

#include <bindings.dsl.h>
#include "opencv2/core.hpp"

#include "namespace.hpp"

--------------------------------------------------------------------------------

-- | Normalization type
data NormType
   = Norm_Inf
   | Norm_L1
   | Norm_L2
   | Norm_L2SQR
   | Norm_Hamming
   | Norm_Hamming2
   | Norm_MinMax
     deriving (Show, Eq)

data NormAbsRel
   = NormRelative
   | NormAbsolute
     deriving (Show, Eq)

#num NORM_INF
#num NORM_L1
#num NORM_L2
#num NORM_L2SQR
#num NORM_HAMMING
#num NORM_HAMMING2
#num NORM_MINMAX

#num NORM_RELATIVE

marshalNormType :: NormAbsRel -> NormType -> Int32
marshalNormType absRel normType =
    case absRel of
      NormRelative -> c'normType .|. c'NORM_RELATIVE
      NormAbsolute -> c'normType
  where
    c'normType = case normType of
        Norm_Inf      -> c'NORM_INF
        Norm_L1       -> c'NORM_L1
        Norm_L2       -> c'NORM_L2
        Norm_L2SQR    -> c'NORM_L2SQR
        Norm_Hamming  -> c'NORM_HAMMING
        Norm_Hamming2 -> c'NORM_HAMMING2
        Norm_MinMax   -> c'NORM_MINMAX
