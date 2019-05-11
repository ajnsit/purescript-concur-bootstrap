module Bootstrap.Common where

-- | For styling a component, use one of the eight variants.
import Concur.React.Props as P

-- | For styling a component, use one of the eight variants.
data ComponentVariant
  = CPrimary
  | CSecondary
  | CSuccess
  | CDanger
  | CWarning
  | CInfo
  | CLight
  | CDark

componentVariantToString :: ComponentVariant -> String
componentVariantToString t = case t of
  CPrimary -> "primary"
  CSecondary -> "secondary"
  CSuccess -> "success"
  CDanger -> "danger"
  CWarning -> "warning"
  CInfo -> "info"
  CLight -> "light"
  CDark -> "dark"

variant :: forall a. ComponentVariant -> P.Props a
variant v = P.unsafeMkProp "variant" (componentVariantToString v)
