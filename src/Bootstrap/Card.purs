module Bootstrap.Card where

import Bootstrap.Common (ComponentVariant, componentVariantToString)
import Bootstrap.FFI (_card, _cardBody, _cardColumns, _cardFooter, _cardGroup, _cardHeader, _cardImg, _cardImgOverlay, _cardLink, _cardSubtitle, _cardText, _cardTitle)
import Concur.React (el, el')
import Concur.React.DOM (El, El1, El')
import Concur.React.Props as P
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

_cardNode :: Array Props -> Array ReactElement -> ReactElement
_cardNode props = unsafeCreateElement _card (unsafeFromPropsArray props)
_cardGroupNode :: Array Props -> Array ReactElement -> ReactElement
_cardGroupNode props = unsafeCreateElement _cardGroup (unsafeFromPropsArray props)
_cardColumnsNode :: Array Props -> Array ReactElement -> ReactElement
_cardColumnsNode props = unsafeCreateElement _cardColumns (unsafeFromPropsArray props)
_cardHeaderNode :: Array Props -> Array ReactElement -> ReactElement
_cardHeaderNode props = unsafeCreateElement _cardHeader (unsafeFromPropsArray props)
_cardTextNode :: Array Props -> Array ReactElement -> ReactElement
_cardTextNode props = unsafeCreateElement _cardText (unsafeFromPropsArray props)
_cardLinkNode :: Array Props -> Array ReactElement -> ReactElement
_cardLinkNode props = unsafeCreateElement _cardLink (unsafeFromPropsArray props)
_cardBodyNode :: Array Props -> Array ReactElement -> ReactElement
_cardBodyNode props = unsafeCreateElement _cardBody (unsafeFromPropsArray props)
_cardTitleNode :: Array Props -> Array ReactElement -> ReactElement
_cardTitleNode props = unsafeCreateElement _cardTitle (unsafeFromPropsArray props)
_cardSubtitleNode :: Array Props -> Array ReactElement -> ReactElement
_cardSubtitleNode props = unsafeCreateElement _cardSubtitle (unsafeFromPropsArray props)
_cardFooterNode :: Array Props -> Array ReactElement -> ReactElement
_cardFooterNode props = unsafeCreateElement _cardFooter (unsafeFromPropsArray props)
_cardImgNode :: Array Props -> Array ReactElement -> ReactElement
_cardImgNode props = unsafeCreateElement _cardImg (unsafeFromPropsArray props)
_cardImgOverlayNode :: Array Props -> Array ReactElement -> ReactElement
_cardImgOverlayNode props = unsafeCreateElement _cardImgOverlay (unsafeFromPropsArray props)

-- | See `card`
card_ :: El1
card_ = el _cardNode

-- | Bootstrap’s cards provide a flexible and extensible content container with multiple variants and options.
card :: El
card = el' _cardNode

-- | See `card`
card' :: El'
card' = card []

-- | You can change a card's appearance by changing their background
bg :: forall a. ComponentVariant -> P.Props a
bg c = P.unsafeMkProp "bg" (componentVariantToString c)

-- | You can change a card's appearance by changing their border
border :: forall a. ComponentVariant -> P.Props a
border c = P.unsafeMkProp "border" (componentVariantToString c)

-- | See `cardGroup`
cardGroup_ :: El1
cardGroup_ = el _cardGroupNode

-- | A Way of grouping cards
cardGroup :: El
cardGroup = el' _cardGroupNode

-- | See `cardGroup`
cardGroup' :: El'
cardGroup' = cardGroup []

-- | See `cardColumns`
cardColumns_ :: El1
cardColumns_ = el _cardColumnsNode

-- | A Way of grouping cards
cardColumns :: El
cardColumns = el' _cardColumnsNode

-- | See `cardColumns`
cardColumns' :: El'
cardColumns' = cardColumns []

-- | See `cardHeader`
cardHeader_ :: El1
cardHeader_ = el _cardHeaderNode

-- | You may add a header by adding a CardHeader component.
cardHeader :: El
cardHeader = el' _cardHeaderNode

-- | See `cardHeader`
cardHeader' :: El'
cardHeader' = cardHeader []

-- | See `cardText`
cardText_ :: El1
cardText_ = el _cardTextNode

-- | Using CardText inside the CardBody will line them up nicely.
cardText :: El
cardText = el' _cardTextNode

-- | See `cardText`
cardText' :: El'
cardText' = cardText []

-- | See `cardLink`
cardLink_ :: El1
cardLink_ = el _cardLinkNode

-- | CardLinks are used to line up links next to each other.
cardLink :: El
cardLink = el' _cardLinkNode

-- | See `cardLink`
cardLink' :: El'
cardLink' = cardLink []

-- | See `cardBody`
cardBody_ :: El1
cardBody_ = el _cardBodyNode

-- | Use CardBody to pad content inside a Card.
cardBody :: El
cardBody = el' _cardBodyNode

-- | See `cardBody`
cardBody' :: El'
cardBody' = cardBody []

-- | See `cardTitle`
cardTitle_ :: El1
cardTitle_ = el _cardTitleNode

-- | Use CardTitle to pad a title inside a Card.
cardTitle :: El
cardTitle = el' _cardTitleNode

-- | See `cardTitle`
cardTitle' :: El'
cardTitle' = cardTitle []

-- | See `cardSubtitle`
cardSubtitle_ :: El1
cardSubtitle_ = el _cardSubtitleNode

-- | Use CardSubtitle to pad a subtitle inside a Card.
cardSubtitle :: El
cardSubtitle = el' _cardSubtitleNode

-- | See `cardSubtitle`
cardSubtitle' :: El'
cardSubtitle' = cardSubtitle []

-- | See `cardFooter`
cardFooter_ :: El1
cardFooter_ = el _cardFooterNode

-- | Use CardFooter to pad a footer inside a Card.
cardFooter :: El
cardFooter = el' _cardFooterNode

-- | See `cardFooter`
cardFooter' :: El'
cardFooter' = cardFooter []

-- | See `cardImg`
cardImg_ :: El1
cardImg_ = el _cardImgNode

-- | Cards include a few options for working with images. Choose from appending “image caps” at either end of a card, overlaying images with card content, or simply embedding the image in a card.
cardImg :: El
cardImg = el' _cardImgNode

-- | See `cardImg`
cardImg' :: El'
cardImg' = cardImg []

-- | See `cardImgOverlay`
cardImgOverlay_ :: El1
cardImgOverlay_ = el _cardImgOverlayNode

-- | Turn an image into a card background and overlay your card’s text. Depending on the image, you may or may not need additional styles or utilities.
cardImgOverlay :: El
cardImgOverlay = el' _cardImgOverlayNode

-- | See `cardImgOverlay`
cardImgOverlay' :: El'
cardImgOverlay' = cardImgOverlay []
