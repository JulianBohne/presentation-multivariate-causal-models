# Decker Template

This is a small template for Decker, which includes an option to add a footer to your decks.

> Note: You should install [git lfs](https://git-lfs.com/) to clone this properly.

## Useful Links
- [Documentation](https://decker.cs.tu-dortmund.de/decks/decker/manual/index.html)
    - Documentation as a Website or a PDF at the top
    - Documentation in Decker grouped by topics below
- [Decker](https://decker.cs.tu-dortmund.de/)
    - Deckers home page

## Quickstart Guide
1. Download and install [Decker](https://decker.cs.tu-dortmund.de/)
    1. Download the executable and place it in a folder of your choice
        > Note: I'm using the current "v0.14.0-rc2" version (version: 0.14.0, branch: HEAD, commit: 792437a68b98c47674567ca9be2cb8a4c0e1484f, tag: v0.14.0-rc2, build date: 2023-11-15)
    2. Add the folder to your path environment variable
    > More detailed instructions can be found [here](https://decker.cs.tu-dortmund.de/decks/decker/manual/index.html)
2. Run `decker --server` in this directory
    - It builds the markdown files into the `public` folder and watch for changes to incrementally build the decks
    - It starts a web server (on port 8888)
4. Visit `http://localhost:8888/index.html` to view the compiled decks
5. Edit the `...-deck.md` files and the markdown files in the `slide-sets` folder
    > This can be done in e.g. VSCode (there is also an extension pack `Decker Extension Pack`, that you might find useful)

## Project Structure
- `decker.yaml` (file)
    - This is the configuration file of this project. These settings can be overwritten in the header section of `...-deck.md` files.
    > Note: Math macros can be defined in here
- `example-deck.md` (file)
    - This is an example presentation deck. It is split into multiple parts in the `example-slides` directory.
- `example-slides` (directory)
    - This directory contains all parts of the `example-deck.md`.
- `styles/custom-styles.css` (file)
    - This is an example, how you can add custom styles to your presentation. It is added in the `decker.yaml`.
- `jsconfig.json` (file)
    - If you want to add some JavaScript to your presentation, this will make sure that you get some autocomplete for Deckers external dependencies found in the public (build) folder (if you need them).
- `plugins/footer/before.lua` (file)
    - This file is used to pre process the markdown to allow for the footer-text option in the metadata. It is enabled in the `decker.yaml`.

## Notes
- There should be an empty line after an `[:import](...)` statement. Otherwise it doesn't work (at least not in the "latest" version)
- Do not trust the Decker version stamp (e.g. `0.14.0`). Look at the commit hash and build date to make sure versions match.
