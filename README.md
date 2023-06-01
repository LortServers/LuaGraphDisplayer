# LuaGraphDisplayer
Lua script that displays graphs.

**__DISCLAIMER__**

**__This library does NOT protect from attacks based on executing Lua code through `load()` function, used for calculating points. You have to validate equasions by yourself, or modify `load()` behaviour to ensure they are safe.__**

**How does it work?**

You will be asked for input: the equasion (e.g. `y = x`) that is following Lua syntax (e.g. `y = math.abs(x)`) and X/Y print limits.

You should then see a graph according to the calculations of the equasion.

**FAQ**

"*This code is repetitive, isn't readable, and looks weird.*"

Sure, the code in it's current stage is probably kept for one of four reasons:

1. Current code has been uploaded for archival purposes.

2. Repetitive and unreadable code was a part of debugging and constant changes made to the code.

3. This isn't a main project to focus on (at least yet).

4. I (Lort533) usually make code like this (due to reason 2), and optimize it later on.
