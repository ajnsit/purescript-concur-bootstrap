module Main where

import Prelude

import Bootstrap.Alert (alert, alertHeading, alertLink)
import Bootstrap.Badge (badge)
import Bootstrap.Breadcrumb (crumbs)
import Bootstrap.Button (button, checkboxButtonGroup, radioButtonGroup)
import Bootstrap.Common (ComponentVariant(..), variant)
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Data.Maybe (Maybe(..), maybe)
import Effect (Effect)

data Page = Home | Alert | Radios | Checkboxes
derive instance eqPage :: Eq Page
renderPageCrumbItem :: forall a. Page -> Array (Widget HTML a)
renderPageCrumbItem Home = [D.text "Home"]
renderPageCrumbItem Alert = [D.text "Alert Page"]
renderPageCrumbItem Radios = [D.text "Radios"]
renderPageCrumbItem Checkboxes = [D.text "Checkboxes"]
pages :: Array Page
pages = [Home, Alert, Radios, Checkboxes]
renderPageCrumb :: Page -> Widget HTML Page
renderPageCrumb = crumbs [] renderPageCrumbItem pages

renderPage :: Page -> Widget HTML Page
renderPage Home = D.div []
  [ renderPageCrumb Home
  , button [Alert <$ P.onClick] [D.text "Say Hello"]
  ]
renderPage Alert = go false
  where
  go alertShown = do
    res <- D.div []
      [ Just <$> renderPageCrumb Alert
      , alert [variant VariantPrimary]
        [ alertHeading [] [D.text "How's it going!"]
        , alertLink [Nothing <$ P.onClick]
          [ D.text "Click to show one more alert"
          , badge [] [D.text "NEW!"]
          ]
        , D.div [] [ alertLink [Just Home <$ P.onClick] [ D.text "Click to go back" ] ]
        ]
      , if alertShown
         then alert [variant VariantDanger] [D.text "You asked for this alert!"]
         else mempty
      ]
    maybe (go true) pure res
renderPage Radios = D.div []
  [ renderPageCrumb Radios
    , D.div [] [D.text "The behaviour of this widget is weird by design (for testing)"]
    , radioButtonGroup [P.name "radios"] (pure <<< renderPageCrumb) pages Radios
    ]
renderPage Checkboxes = D.div []
  [ renderPageCrumb Checkboxes
    , D.div [] [D.text "The behaviour of this widget is weird by design (for testing)"]
    , let go selected = checkboxButtonGroup [P.name "checkboxes"] (\p -> pure (pure <$> renderPageCrumb p)) pages selected >>= go
      in go [Checkboxes]
    ]

mainWidget :: forall a. Widget HTML a
mainWidget = D.div'
  [ D.h1 [] [D.text "Concur Bootstrap Example"]
  , let go page = renderPage page >>= go
    in go Home
  ]

main :: Effect Unit
main = runWidgetInDom "root" mainWidget
