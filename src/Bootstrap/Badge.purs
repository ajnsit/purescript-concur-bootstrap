module Bootstrap.Badge where

import Bootstrap.FFI (_badge)
import Concur.React (el, el')
import Concur.React.DOM (El, El1, El')
import Concur.React.Props as P
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

_badgeNode :: Array Props -> Array ReactElement -> ReactElement
_badgeNode props = unsafeCreateElement _badge (unsafeFromPropsArray props)

-- | See `badge`
badge_ :: El1
badge_ = el _badgeNode

-- | Badges provide annotations for the parent element.
-- | Badges scale to match the size of the immediate parent element by using relative font sizing and em units.
-- | Badges can be used as part of links or buttons to provide a counter.
badge :: El
badge = el' _badgeNode

-- | See `badge`
badge' :: El'
badge' = badge []

-- | Add the pill prop to make badges more rounded with some additional horizontal padding
pill :: forall a. P.Props a
pill = P.unsafeMkProp "pill" "true"
