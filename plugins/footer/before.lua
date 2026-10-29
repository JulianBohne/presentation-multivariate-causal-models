
function Pandoc(doc)

  local footer = doc.meta["footer-text"]

  if footer then
    local footer_text = pandoc.utils.stringify(footer):gsub('"', '\\"')

    local style = string.format([[
<style>
:root {
    --footer-text: "%s";
    --footer-height: min(5dvh, 3.5vw);
}
:root:has(#title-slide.present) {
    --footer-height: 0px;
}
.reveal:not(.has-vertical-slides) .slide-number.slide-number {
    bottom: calc(0.8em + var(--footer-height));
}
.reveal.reveal {
    height: calc(100%% - var(--footer-height));
    overflow: visible;
}
.reveal.reveal::after {
    content: var(--footer-text);
    position: absolute;
    top: 100%%;
    height: var(--footer-height);
    font-size: calc(var(--footer-height) / 2);
    width: 100%%;
    text-align: center;
    align-content: center;
    z-index: 1;
    opacity: 0.5;
    font-style: normal;
}
</style>
]], footer_text)

    -- insert at the end of document
    table.insert(doc.blocks, pandoc.RawBlock("html", style))
  end

  return doc
end
