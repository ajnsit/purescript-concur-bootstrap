module Bootstrap.FFI where

import React (Children, ReactClass)

type BootstrapClass = ReactClass { children :: Children }

-- Components

-- Alert
foreign import _alert :: BootstrapClass
foreign import _alertLink :: BootstrapClass
foreign import _alertHeading :: BootstrapClass

-- Badge
foreign import _badge :: BootstrapClass

-- Breadcrumb
foreign import _breadcrumb :: BootstrapClass
foreign import _breadcrumbItem :: BootstrapClass

-- Button
foreign import _button :: BootstrapClass
