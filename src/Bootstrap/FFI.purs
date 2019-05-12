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
foreign import _buttonToolbar :: BootstrapClass
foreign import _buttonGroup :: BootstrapClass
foreign import _toggleButton :: BootstrapClass
foreign import _toggleButtonGroup :: BootstrapClass

-- Card
foreign import _card :: BootstrapClass
foreign import _cardGroup :: BootstrapClass
foreign import _cardColumns :: BootstrapClass
foreign import _cardHeader :: BootstrapClass
foreign import _cardText :: BootstrapClass
foreign import _cardLink :: BootstrapClass
foreign import _cardBody :: BootstrapClass
foreign import _cardTitle :: BootstrapClass
foreign import _cardSubtitle :: BootstrapClass
foreign import _cardFooter :: BootstrapClass
foreign import _cardImg :: BootstrapClass
foreign import _cardImgOverlay :: BootstrapClass
