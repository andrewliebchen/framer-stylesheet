# Stylesheets for Framer

Stylesheets for Framer is a module provides a method for defining and using repeatable layer styles.

## Usage
Download stylesheet.coffee and add it to your `/modules` folder. Include the module in your Framer project:

```coffee
Style = require 'stylesheet'
```

Then, you'll need to create a style object. If you know CSS, you can think of the style object as your stylesheet. "Classes" are the first level of the object and are used to apply styles to layers. Classes contain style properties.

So, in this example, let's say you have a "card" style that you want to apply in multiple places. In this example, think of `card` as the class name in CSS:

```coffee
styles =
  card:
    backgroundColor: 'white'
    borderRadius: 5
    borderColor: 'CCC'
    borderWidth: 1
```

Then, you'll apply the card style to your layers:

```coffee
profileCard = new Layer Style styles.card,
  width: 1000
  height: 300

infoCard = new Layer Style styles.card,
  size: 400
```

You can even apply more than one style per layer:

```coffee
profileCard = new Layer Style styles.card, styles.profile,
  width: 1000
  height: 300
```

Any layer style defined on the layer will be applied instead of the style in the style object:

```coffee
styles =
  layer:
    backgroundColor: 'red'

layerA = new Layer Style styles.layer
# layerA will be red

layerB = new Layer Style styles.layer,
  backgroundColor: 'blue'
# layerB will be blue
```

## Why do this?

The module is really simple, hardly anything at all (just one function and a couple lines, relying heavily on lodash `assign`). So what's the point. I just got really annoyed constantly applying styles to `TextLayers`:

```coffee
text = new TextLayer
  fontFamily: '-apple-system',
  fontSize: 14
  ...
```

So I started to store text styles in an objet:

```coffee
textStyles =
  fontFamily: '-apple-system'
  fontSize: 14
  ...

text = new TextLayer _.assign {}, textStyles,
  text: 'Heck ya!'
```

Helpful, but still...got sick of typing that Lodash function over and over and over...

## Feedback

For questions or comments, please open an issue or [email me](mailto:andrewliebchen@gmail.com). For bugs and feature requests, please open an issue.
