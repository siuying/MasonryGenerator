# Masonry Generator

A Mansory extension to generate native NSLayoutConstraint code from Mansory code.

## Why?

Sometime I want to write constraints code easily but I dont want to add another 
dependency (such as writing a library). Generating native constraints can be 
handy.

## Usage

Import MansoryGenerator:

```
#import "MasonryGenerator.h"
```

Then add following line before your layout code:

```
[MasonryGenerator install];
```

**Important: You should only include MansoryGenerator during development!**

## License

MIT License.