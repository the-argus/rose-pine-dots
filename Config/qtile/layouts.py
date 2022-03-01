from libqtile import layout
from color import colors
from libqtile.config import Match
from custom_layouts import CustomTile

BORDER_WIDTH = 2
MARGIN = 8
SMART_GAPS = False

WINDOW_MARGIN = MARGIN #int(MARGIN/2)

# width of the border of selected window if it's the only window in a group
# only used by monad wide and monad tall
SINGLE_BORDER_WIDTH = BORDER_WIDTH

ACTIVE_COLOR = colors["magenta"]
INACTIVE_COLOR = colors["bg"]

floating = layout.Floating(
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR,
    border_width=2
)

customtile = CustomTile(
    border_width=BORDER_WIDTH,
    margin=WINDOW_MARGIN,
    margin_on_single=not SMART_GAPS,
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR
)

tile = layout.Tile(
    border_width=BORDER_WIDTH,
    margin=WINDOW_MARGIN,
    margin_on_single=not SMART_GAPS,
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR
)

bsp = layout.Bsp(
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR,
    border_width=BORDER_WIDTH,
    margin=WINDOW_MARGIN
)

monadwide = layout.MonadWide(
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR,
    border_width=BORDER_WIDTH,
    margin=WINDOW_MARGIN,
    single_margin=not SMART_GAPS,
    single_border_width=SINGLE_BORDER_WIDTH
)

monadtall = layout.MonadTall(
    border_focus=ACTIVE_COLOR,
    border_normal=INACTIVE_COLOR,
    border_width=BORDER_WIDTH,
    margin=WINDOW_MARGIN,
    single_margin=not SMART_GAPS,
    single_border_width=SINGLE_BORDER_WIDTH
)

custom_layouts = [
    tile,
    floating,
    bsp,
    monadwide,
    monadtall
]
