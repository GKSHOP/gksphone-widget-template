# custom-widget

Demo FiveM resource for the GKSPHONE **Custom Widget API** (`AddCustomWidget`).

Full GitBook-style docs (paste into docs.gkshop.org): [`docs/gitbook/custom-widget.md`](../docs/gitbook/custom-widget.md)

Mirror of Custom App docs: [Custom App](https://docs.gkshop.org/gksphone-v2/custom-app)

## Install

1. Copy `custom-widget` into your server `resources` folder (or keep it next to `gksphone`).
2. In `server.cfg`:

```cfg
ensure gksphone
ensure custom-widget
```

3. Restart / join → Edit home screen → **+** → **Widgets** → **Demo Widget**.

## How it works

- `client.lua` waits for `gksphone`, then calls:

```lua
exports['gksphone']:AddCustomWidget({
  id = 'demo-widget',
  widgetUrl = 'https://cfx-nui-custom-widget/ui/widget.html',
  title = 'Demo Widget',
  size = '2x2',
  ...
})
```

- The phone embeds `ui/widget.html` in an iframe.
- Phone → widget messages:
  - `gksphone:widget:init` `{ widgetId, size, editing }`
  - `gksphone:widget:editing` `{ editing }`

## Customize

| File | Purpose |
|------|---------|
| `client.lua` | Registration (`id`, `title`, `size`, `widgetUrl`) |
| `ui/widget.html` | Markup |
| `ui/widget.css` | Look |
| `ui/widget.js` | Logic + postMessage handlers |

If you rename the resource folder, update `widgetUrl` (`cfx-nui-<folder-name>/...`) or keep using `GetCurrentResourceName()` as in this demo.
