You can move filesystem trees around between mount namespaces
very simply with the new "mount as file descriptor" calls in
modern Linux kernels.

run as
```
docker run --privileged --pid=host -v /var/run/docker.sock:/var/run/docker.sock justincormack/addmount agitated_bose /tmp xenodochial_leavitt /tmp
```

where `agitated_bose` and `xenodochial_leavitt` are container names or process IDs.
Replace the paths with any paths you like.

The C code is very simple: `open_tree` is equivalent to `mount --bind` and
`move_mount` will move the mount corresponding to the file descriptor. Use
file descriptors for everything!
