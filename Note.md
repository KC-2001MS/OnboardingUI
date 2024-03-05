# Note

## How to Build Swift-DocC
1. Change the following code
``` swift
    Text("Continue", bundle: .module)
```
to
``` swift
    Text("Continue")
```
2. Save Workspace
3. Open Terminal
4. Go to the root path of this repository
5. Execute the following command
``` zsh
    make docc
```
6. Revert the code as follows
``` swift
    Text("Continue")
```
to
``` swift
    Text("Continue", bundle: .module)
```
