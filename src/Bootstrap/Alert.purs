module Bootstrap.Alert where

import Bootstrap.FFI (_alert, _alertHeading, _alertLink)
import Concur.React (el, el')
import Concur.React.DOM (El, El1, El')
import Concur.React.Props as P
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

_alertNode :: Array Props -> Array ReactElement -> ReactElement
_alertNode props = unsafeCreateElement _alert (unsafeFromPropsArray props)
_alertLinkNode :: Array Props -> Array ReactElement -> ReactElement
_alertLinkNode props = unsafeCreateElement _alertLink (unsafeFromPropsArray props)
_alertHeadingNode :: Array Props -> Array ReactElement -> ReactElement
_alertHeadingNode props = unsafeCreateElement _alertHeading (unsafeFromPropsArray props)

-- | See `alert`
alert_ :: El1
alert_ = el _alertNode

-- | Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages.
-- | Alerts are available for any length of text, as well as an optional dismiss button. See `dismissable`
alert :: El
alert = el' _alertNode

-- | See `alert`
alert' :: El'
alert' = alert []

-- | See `alertLink`
alertLink_ :: El1
alertLink_ = el _alertLinkNode

-- | Use alertLink to provide matching colored links within any alert
alertLink :: El
alertLink = el' _alertLinkNode

-- | See `alertLink`
alertLink' :: El'
alertLink' = alertLink []

-- | See `alertHeading`
alertHeading_ :: El1
alertHeading_ = el _alertHeadingNode

-- | Add a matching color heading within any alert
alertHeading :: El
alertHeading = el' _alertHeadingNode

-- | See `alertHeading`
alertHeading' :: El'
alertHeading' = alertHeading []

-- | Add the dismissible prop to add a functioning dismiss button to the Alert
-- | TODO: The button is added but it doesn't work. Seems to be a React-Bootstrap bug.
dissmissable :: forall a. P.Props a
dissmissable = P.unsafeMkProp "dissmissable" "true"
