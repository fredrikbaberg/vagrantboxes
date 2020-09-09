# virtualbox-builder
Build Virtualbox boxes from Hyper-V instance.

Use:
- `vagrant up`
- `vagrant ssh`
- `wget https://raw.githubusercontent.com/fredrikbaberg/vagrantboxes/master/virtualbox-builder/build.sh`
- `bash build.sh`

Built boxes are stored in folder `boxes`, accessible from host.

Finally, from host, publish with:
`vagrant cloud publish --release <repo name>/<name> YYYYMM.DD.N <provider> <box path>`