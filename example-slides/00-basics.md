
# Hello Decker!

Hello there!

This is a Decker slide.

Every slide starts with a title, which is denoted with a `#` at the beginning of the line.

# Hello Again!

This is just regular [pandoc](https://pandoc.org/) markdown syntax, so all the usual things work:

- Unordered Lists

1. Ordered Lists
2. [links](https://example.com)
3. *italic*, **bold**, ~~striked out~~ or `monospaced` text

```js
function even(code, blocks) {
  console.log('work');
}
```

> More examples can be found in the [manual](https://decker.cs.tu-dortmund.de/decks/decker/manual//index.html)!

# In the browser

The markdown is converted to `html` and the slides use [reveal.js](https://revealjs.com/) to make it interactive!

![This is a smiley](/images/smiley.jpg){ height=300px }

Thanks to [mathjax](https://www.mathjax.org/), we can also render math. Either inline $a^2 + b^2 = c^2$, or as a block:
$$ f(x) = \sum_{i = 0}^N x \cdot i $$
