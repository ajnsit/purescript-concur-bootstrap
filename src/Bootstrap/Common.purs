module Bootstrap.Common where

-- | For styling a component, use one of the eight variants.
import Concur.React.Props as P

-- | For styling a component, use one of the eight variants.
data ComponentVariant
  = VariantPrimary
  | VariantSecondary
  | VariantSuccess
  | VariantDanger
  | VariantWarning
  | VariantInfo
  | VariantLight
  | VariantDark

componentVariantToString :: ComponentVariant -> String
componentVariantToString t = case t of
  VariantPrimary -> "primary"
  VariantSecondary -> "secondary"
  VariantSuccess -> "success"
  VariantDanger -> "danger"
  VariantWarning -> "warning"
  VariantInfo -> "info"
  VariantLight -> "light"
  VariantDark -> "dark"

variant :: forall a. ComponentVariant -> P.Props a
variant v = P.unsafeMkProp "variant" (componentVariantToString v)

-- | Adds a visual "active" state to a Component
-- | When added to Breadcrumb Items it also disables the link.
active :: forall a. P.Props a
active = P.unsafeMkProp "active" "true"

-- | Size of a component
data Size
  = Small
  | Large
  | Default

-- | Change the size of a component
size :: forall a. Size -> P.Props a
size s = case s of
  Default -> P.emptyProp
  Small -> P.unsafeMkProp "size" "sm"
  Large -> P.unsafeMkProp "size" "lg"

-- | Create block level buttons—those that span the full width of a parent—by adding block
block :: forall a. P.Props a
block = P.unsafeMkProp "block" "true"
