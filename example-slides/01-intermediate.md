
# Intermediate

# Note

The previous slide was empty, which makes it render as a nice banner 😄

# Custom HTML

Since you can just embed HTML into markdown, you can get creative!

<button id="my-button" class="big-button">Click me! 0</button>
<script>
const button = document.getElementById('my-button');

let counter = 0;

button.onclick = () => {
    button.innerText = `Click me! ${++counter}`;
}
</script>
<style>
/* NOTE: Styles can also be included through the decker.yaml */
.big-button {
    font-size: 2rem;
}
</style>

# Classes

::: columns-1-1

A fenced block is just a `<div>` with some content.
(It starts with `::: some-class` and ends with `:::`)

The `columns-1-1` is the class applied to this `<div>`.
(The `columns-1-1` class is built into decker and used for [layouting](https://decker.cs.tu-dortmund.de/decks/decker/manual//decks/writing-layout-deck.html#/title-slide).)

:::

[:vspace](20px)

::: { .my-class .my-other-class }
A fenced block can also have multiple classes.
(If you want a fenced block without classes, use `::: {}` at the start.)
:::

We can also use [inline styling]{ .my-class }.

<style>
/* NOTE: Styles can also be included through the decker.yaml */
.my-class {
    /* NOTE: These variables are explained in https://decker.cs.tu-dortmund.de/decks/decker/manual//decks/technical-css-variables-deck.html#/semantische-akzentfarben */
    background: var(--violetish);
}
.my-other-class {
    padding: 10px;
}
</style>

# Fragments

Elements with the `fragment` class don't show up immediately.

::: fragment

Only when you continue.

It also works: [Inline!]{ .fragment }

:::

[:vspace](20px)

::: incremental

- For convenience
- `incremental`
- can be used
- for lists

:::

::: fragment

More can be found in the [decker manual](https://decker.cs.tu-dortmund.de/decks/decker/manual//decks/writing-fragments-deck.html)
and the underlying technology is [reveal.js fragments](https://revealjs.com/fragments/).

:::
