module Bootstrap.FFI where

import React (Children, ReactClass)

type BootstrapClass = ReactClass { children :: Children }

-- Components

foreign import _button :: BootstrapClass
