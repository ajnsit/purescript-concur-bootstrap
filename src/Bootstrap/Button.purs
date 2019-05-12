module Bootstrap.Button where

import Bootstrap.FFI (_button, _buttonGroup, _buttonToolbar, _toggleButton, _toggleButtonGroup)
import Concur.Core.Types (Widget)
import Concur.React (HTML, el, el')
import Concur.React.DOM (El, El1, El')
import Concur.React.Props as P
import Control.MultiAlternative (class MultiAlternative)
import Control.ShiftMap (class ShiftMap)
import Data.Array (catMaybes, elemIndex, index, mapWithIndex)
import Data.Eq (class Eq)
import Data.Function ((#), ($))
import Data.Functor (map, (<$>))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Semigroup ((<>))
import React (ReactElement, unsafeCreateElement)
import React.DOM.Props (Props, unsafeFromPropsArray)

_buttonNode :: Array Props -> Array ReactElement -> ReactElement
_buttonNode props = unsafeCreateElement _button (unsafeFromPropsArray props)

_buttonToolbarNode :: Array Props -> Array ReactElement -> ReactElement
_buttonToolbarNode props = unsafeCreateElement _buttonToolbar (unsafeFromPropsArray props)

_buttonGroupNode :: Array Props -> Array ReactElement -> ReactElement
_buttonGroupNode props = unsafeCreateElement _buttonGroup (unsafeFromPropsArray props)

_toggleButtonNode :: Array Props -> Array ReactElement -> ReactElement
_toggleButtonNode props = unsafeCreateElement _toggleButton (unsafeFromPropsArray props)

_toggleButtonGroupNode :: Array Props -> Array ReactElement -> ReactElement
_toggleButtonGroupNode props = unsafeCreateElement _toggleButtonGroup (unsafeFromPropsArray props)

-- | See `button`
button_ :: El1
button_ = el _buttonNode

-- | A button with custom styles, for actions in forms, dialogs, and more,
-- | with support for multiple sizes, states.
button :: El
button = el' _buttonNode

-- | See `button`
button' :: El'
button' = button []

-- | See `buttonToolbar`
buttonToolbar_ :: El1
buttonToolbar_ = el _buttonToolbarNode

-- | Combine sets of ButtonGroups into a ButtonToolbar for more complex components.
buttonToolbar :: El
buttonToolbar = el' _buttonToolbarNode

-- | See `buttonToolbar`
buttonToolbar' :: El'
buttonToolbar' = buttonToolbar []

-- | See `buttonGroup`
buttonGroup_ :: El1
buttonGroup_ = el _buttonGroupNode

-- | Group a series of buttons together on a single line with the button group.
buttonGroup :: El
buttonGroup = el' _buttonGroupNode

-- | See `buttonGroup`
buttonGroup' :: El'
buttonGroup' = buttonGroup []

-- | Make a set of buttons appear vertically stacked rather than horizontally, but adding vertical to a ButtonGroup.
-- | Split button dropdowns are not supported here.
vertical :: forall a. P.Props a
vertical = P.unsafeMkProp "vertical" "true"

-- | See `toggleButton`
toggleButton_ :: El1
toggleButton_ = el _toggleButtonNode

-- | A button with custom styles, for actions in forms, dialogs, and more,
-- | with support for multiple sizes, states.
toggleButton :: El
toggleButton = el' _toggleButtonNode

-- | See `toggleButton`
toggleButton' :: El'
toggleButton' = toggleButton []

data ToggleButtonType = Checkbox | Radio

-- | See `toggleButtonGroup`
toggleButtonGroup_ :: ToggleButtonType -> El1
toggleButtonGroup_ Checkbox props = el _toggleButtonGroupNode ([P._type "checkbox"] <> props)
toggleButtonGroup_ Radio props = el _toggleButtonGroupNode ([P._type "radio"] <> props)

-- | A button with custom styles, for actions in forms, dialogs, and more,
-- | with support for multiple sizes, states.
toggleButtonGroup :: ToggleButtonType -> El
toggleButtonGroup Checkbox props = el' _toggleButtonGroupNode ([P._type "checkbox"] <> props)
toggleButtonGroup Radio props = el' _toggleButtonGroupNode ([P._type "radio"] <> props)

-- | See `toggleButtonGroup`
toggleButtonGroup' :: ToggleButtonType -> El'
toggleButtonGroup' t = toggleButtonGroup t []

-- | OnChange handler which returns the index of the selected value directly
-- | instead of returning an event object like `P.onChange`
-- | IMPORTANT: Don't use this outside of this module to avoid runtime errors.
unsafeOnIntToggleChange :: P.Props Int
unsafeOnIntToggleChange = P.unsafeMkPropHandler "onChange"

-- | OnChange handler which returns the indices of the selected values directly
-- | instead of returning an event object like `P.onChange`
-- | IMPORTANT: Don't use this outside of this module to avoid runtime errors.
unsafeOnIntArrayToggleChange :: P.Props (Array Int)
unsafeOnIntArrayToggleChange = P.unsafeMkPropHandler "onChange"

-- | Value prop which takes the index of the selected value directly
-- | instead of taking a String for inputs like `P.value`
-- | IMPORTANT: Don't use this outside of this module to avoid runtime errors.
unsafeIntValue :: forall a. Int -> P.Props a
unsafeIntValue = P.unsafeMkProp "value"

-- | ValueArray prop which takes the indices of the selected value directly
-- | instead of taking a String for inputs like `P.value`
-- | IMPORTANT: Don't use this outside of this module to avoid runtime errors.
unsafeIntValueArray :: forall a. Array Int -> P.Props a
unsafeIntValueArray = P.unsafeMkProp "value"

-- | Allows selecting one item from a group of items
radioButtonGroup :: forall m a. ShiftMap (Widget HTML) m => MultiAlternative m  => Eq a => Array (P.Props a) -> (a -> Array (m a)) -> Array a -> a -> m a
radioButtonGroup props render items selected =
  toggleButtonGroup Radio props' (mapWithIndex toItem items)
  where
    changeProp = findSelected <$> unsafeOnIntToggleChange
    props' = case elemIndex selected items of
      Nothing -> [changeProp] <> props
      Just i -> [unsafeIntValue i, changeProp] <> props
    toItem i a = toggleButton [unsafeIntValue i] (render a)
    findSelected i = fromMaybe selected (index items i)

-- | Allows selecting several items from a group of items
checkboxButtonGroup :: forall m a. ShiftMap (Widget HTML) m => MultiAlternative m  => Eq a => Array (P.Props (Array a)) -> (a -> Array (m (Array a))) -> Array a -> Array a -> m (Array a)
checkboxButtonGroup props render items selected =
  toggleButtonGroup Checkbox props' (mapWithIndex toItem items)
  where
    changeProp = findSelected <$> unsafeOnIntArrayToggleChange
    selectedIndices = catMaybes $ selected # map \a -> elemIndex a items
    props' = [unsafeIntValueArray selectedIndices, changeProp] <> props
    toItem i a = toggleButton [unsafeIntValue i] (render a)
    findSelected indices = catMaybes (map (index items) indices)
