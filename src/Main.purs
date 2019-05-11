module Main where

import Prelude

import Bootstrap (button) as Bootstrap
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

hello :: forall a. Widget HTML a
hello = do
  void $ Bootstrap.button [P.onClick] [D.text "Say Hello"]
  D.text "Hello Sailor!"

main :: Effect Unit
main = runWidgetInDom "root" hello
