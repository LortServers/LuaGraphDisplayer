# LuaGraphDisplayer
Lua library that displays graphs.

**__DISCLAIMER__**

**__This library does NOT protect from attacks based on executing Lua code through `load()` function, used for calculating points. You have to validate equasions by yourself, or modify `load()` behaviour to ensure they are safe.__**

**How does it work (the showcase file)?**

You will be asked for input: the equasion (e.g. `y = x`) that is following Lua syntax (e.g. `y = math.abs(x)`) and X/Y print limits.

You should then see a graph according to the calculations of the equasion.

**How you can use it in your code?**

Perhaps you want to calculate few points, but perhaps you want to get a ready table of X/Y positions of a graph, based on given arguments. If you need to, you can get a ready text-based graph that you can show visually with text, or using your own way.

**FAQ**

"*This code is repetitive, isn't readable, and looks weird.*"

Sure, the code in it's current stage is probably kept for one of four reasons:

1. Current code has been uploaded for archival purposes.

2. Repetitive and unreadable code is likely my fault, but it's also a complex project in terms of correctly displaying graphs.

3. This isn't a main project to focus on (at least yet).

4. I (Lort533) usually make code like this, and optimize it later on.
