module Bootstrap where

import Concur.React (el, el')
import Concur.React.DOM (El, El1, El')
import Bootstrap.FFI (_button)
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

buttonNode :: Array Props -> Array ReactElement -> ReactElement
buttonNode props = unsafeCreateElement _button (unsafeFromPropsArray props)

button_ :: El1
button_ = el buttonNode

button :: El
button = el' buttonNode

button' :: El'
button' = button []
