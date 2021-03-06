# @capacitor/browser

The Browser API provides the ability to open an in-app browser and subscribe to browser events.

<!--DOCGEN_INDEX_START-->
<div class="docgen docgen-index">

* [`open(...)`](#open)
* [`close()`](#close)
* [`addListener(...)`](#addlistener)
* [`addListener(...)`](#addlistener)
* [`removeAllListeners()`](#removealllisteners)
* [Interfaces](#interfaces)

</div>
<!--DOCGEN_INDEX_END-->

<!--DOCGEN_API_START-->
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->
<div class="docgen docgen-api">

## API

### open(...)

```typescript
open(options: BrowserOpenOptions) => Promise<void>
```

Open a page with the specified options.

| Param         | Type                                                              |
| ------------- | ----------------------------------------------------------------- |
| **`options`** | <code><a href="#browseropenoptions">BrowserOpenOptions</a></code> |

**Returns:** <code>Promise&lt;void&gt;</code>

**Since:** 1.0.0

--------------------


### close()

```typescript
close() => Promise<void>
```

Web & iOS only: Close an open browser window.

No-op on other platforms.

**Returns:** <code>Promise&lt;void&gt;</code>

**Since:** 1.0.0

--------------------


### addListener(...)

```typescript
addListener(eventName: 'browserFinished', listenerFunc: () => void) => PluginListenerHandle
```

Android & iOS only: Listen for the loading finished event.

| Param              | Type                           |
| ------------------ | ------------------------------ |
| **`eventName`**    | <code>"browserFinished"</code> |
| **`listenerFunc`** | <code>() => void</code>        |

**Returns:** <code><a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

**Since:** 1.0.0

--------------------


### addListener(...)

```typescript
addListener(eventName: 'browserPageLoaded', listenerFunc: () => void) => PluginListenerHandle
```

Android & iOS only: Listen for the page loaded event.

| Param              | Type                             |
| ------------------ | -------------------------------- |
| **`eventName`**    | <code>"browserPageLoaded"</code> |
| **`listenerFunc`** | <code>() => void</code>          |

**Returns:** <code><a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

**Since:** 1.0.0

--------------------


### removeAllListeners()

```typescript
removeAllListeners() => void
```

Remove all native listeners for this plugin.

**Returns:** <code>void</code>

**Since:** 1.0.0

--------------------


### Interfaces


#### BrowserOpenOptions

Represents the options passed to `open`.

| Prop                    | Type                                   | Description                                                                                                                                | Since |
| ----------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| **`url`**               | <code>string</code>                    | The URL to which the browser is opened.                                                                                                    | 1.0.0 |
| **`windowName`**        | <code>string</code>                    | Web only: Optional target for browser open. Follows the `target` property for window.open. Defaults to _blank. Ignored on other platforms. | 1.0.0 |
| **`toolbarColor`**      | <code>string</code>                    | A hex color to which the toolbar color is set.                                                                                             | 1.0.0 |
| **`presentationStyle`** | <code>"fullscreen" \| "popover"</code> | iOS only: The presentation style of the browser. Defaults to fullscreen. Ignored on other platforms.                                       | 1.0.0 |


#### PluginListenerHandle

| Prop         | Type                    |
| ------------ | ----------------------- |
| **`remove`** | <code>() => void</code> |

</div>
<!--DOCGEN_API_END-->
