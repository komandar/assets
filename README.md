<div align="center">

# Assets Archive

A repository containing assets used in my GitHub project's README files.

[![Build Status](https://github.com/komandar/assets/workflows/build/badge.svg)](https://github.com/komandar/assets/actions)

</div>

## Description

I store graphics and other files here away from source code because assets increase the size of the git repo and cannot be easily removed from the git history. This means that clone sizes are permanently inflated; this grows quickly, so if an image is swapped out or removed, it stays in the history. By storing the assets in a separate repository, I can easily swap or adjust the files whenever I want and keep the size of my Git repositories small.

## Usage

Simply add assets to the folder under `src` that has the same name as the repository they belong to, and then reference them with a link such as:

```bash
https://raw.githubusercontent.com/komandar/assets/main/src/repository/showcase.png
```

## Development

### Assets

It is important to optimize content for the web. This will reduce load times, improve file indexing, and conserve storage space. Here are a few things to keep in mind:

1. If possible, images should be `png` to support transparency (alpha channel).
2. Filenames should be in lowercase and separated (if necessary) by a hyphen.
3. Title tag and alt tag of the image should be used to not limit users with screen readers.
4. Showcase images should have a "20-30 pixel padding" around the image and the canvas size should traditionally not exceed "256x256" pixels (if icons).
5. Images should not exceed 1 MB in size.
6. If the platform allows it, more modern image formats should be used like currently AVIF or WEBP.
