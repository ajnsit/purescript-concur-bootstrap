module Main where

import Prelude

import Bootstrap.Alert (alert, alertHeading, alertLink)
import Bootstrap.Badge (badge)
import Bootstrap.Breadcrumb (crumbs)
import Bootstrap.Button (button)
import Bootstrap.Common (ComponentVariant(..), variant)
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

data Page = Home | Alert
derive instance eqPage :: Eq Page
renderPageCrumbItem :: forall a. Page -> Array (Widget HTML a)
renderPageCrumbItem Home = [D.text "Home"]
renderPageCrumbItem Alert = [D.text "Alert Page"]
pages :: Array Page
pages = [Home, Alert]
renderPageCrumb :: Page -> Widget HTML Page
renderPageCrumb = crumbs [] renderPageCrumbItem pages

renderPage :: Page -> Widget HTML Page
renderPage Home = D.div []
  [ renderPageCrumb Home
  , button [Alert <$ P.onClick] [D.text "Say Hello"]
  ]
renderPage Alert = D.div []
  [ renderPageCrumb Alert
  , alert [variant CPrimary]
    [ alertHeading [] [D.text "How's it going!"]
    , alertLink [Home <$ P.onClick]
      [ D.text "Click to go back"
      , badge [] [D.text "NEW!"]
      ]
    ]
  ]

mainWidget :: forall a. Widget HTML a
mainWidget =
  let go page = renderPage page >>= go
  in go Home

main :: Effect Unit
main = runWidgetInDom "root" mainWidget
