module Bootstrap.Breadcrumb where

import Bootstrap.Common (active)
import Bootstrap.FFI (_breadcrumb, _breadcrumbItem)
import Concur.Core.Types (Widget)
import Concur.React (HTML, el, el')
import Concur.React.DOM (El, El1, El')
import Concur.React.Props as P
import Control.MultiAlternative (class MultiAlternative)
import Control.ShiftMap (class ShiftMap)
import Data.Eq (class Eq, (==))
import Data.Functor (map, (<$))
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

_breadcrumbNode :: Array Props -> Array ReactElement -> ReactElement
_breadcrumbNode props = unsafeCreateElement _breadcrumb (unsafeFromPropsArray props)

_breadcrumbItemNode :: Array Props -> Array ReactElement -> ReactElement
_breadcrumbItemNode props = unsafeCreateElement _breadcrumbItem (unsafeFromPropsArray props)

-- | See `breadcrumb`
breadcrumb_ :: El1
breadcrumb_ = el _breadcrumbNode

-- | Indicate the current page’s location within a navigational hierarchy that automatically adds separators via CSS.
breadcrumb :: El
breadcrumb = el' _breadcrumbNode

-- | See `breadcrumb`
breadcrumb' :: El'
breadcrumb' = breadcrumb []

-- | See `breadcrumbItem`
breadcrumbItem_ :: El1
breadcrumbItem_ = el _breadcrumbItemNode

-- | A breadcrumb item
-- | Add active prop to active Breadcrumb.Item. Do not set both active and href attributes. active overrides href and span element is rendered instead of a.
breadcrumbItem :: El
breadcrumbItem = el' _breadcrumbItemNode

-- | See `breadcrumbItem`
breadcrumbItem' :: El'
breadcrumbItem' = breadcrumbItem []

-- | A Higher Level Component for Breadcrumbs
crumbs :: forall m a. ShiftMap (Widget HTML) m => MultiAlternative m  => Eq a => Array (P.Props a) -> (a -> Array (m a)) -> Array a -> a -> m a
crumbs props render items selected =
  breadcrumb props (map toItem items)
  where
    toItem a =
      breadcrumbItem
        (if (a==selected) then [active] else [a <$ P.onClick])
        (render a)
