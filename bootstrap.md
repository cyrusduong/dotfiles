# A fresh arch installation

This is my guide on how to setup a new arch installation and use the provided bootstrap.sh file.

## Archinstall

Run the `archinstall` setup. That should get you off the ground. I suggest following the prompts in there.

Post-setup, it will ask you to chroot into the newly created installation. Confirm.

## Calling our bootstrap script

Lets grab our bootstrap scipt from our git repo where the backup of our dotnet files are located.

```
curl --location --remote-header-name --remote-name TODO: Add file location here
```

This takes from the general recommendations of the Installation Guide from the arch wiki and compresses
them into an easy to run shell scipt. Read it's content to understand what it is doing.

Run it and hang on.

```
chmod +x bootstrap.sh
./bootstrap.sh
```

## Setting up lazyvim

LazyVim gets installed in bootstrap but everything may not be working as expected on the first few loads.
Open it a few times, sync/update, and then run `:CheckHealth` to opt-in to see what else still needs setup.

## Setting up CopyQ

Open an instance of CopyQ (if not started yet) and go into its preferences.
Be sure to set the theme and clipboard sync as wanted. It may make sense to have CopyQ pick up on mouse selected text.

## Using a YADM (yet another dotnet manager)

TODO:

## Setting a backup

Post-install we'll want to ensure that we continually backup our machine in-case we make any oopsies
rendering our system unusable.


There are two approaches we'll use to handle these different situations.

### btrfs snapshots

Snapshots allow us the ability to esentally replicate the timetravel functionality of MacOS by keeping
diffs of files in a seperate location that can be later restored if accidentally deleted or changed.

#### recovering using snapsots

TODO:

### rsync user directory

TODO:

#### recovering from backup of user directory

TODO:

### Running the backups on boot

We can make the relatively safe assumption that during boot our install medium aswell as our
user directories and files are in a good state. We'll use a `backup.sh` script that is called
in a new terminal window on login (to observe for any issues).

This way between boots our backups are also somewhat "imaged" and saved to a remote location.

In the worst case-event of hardware/drive failure we can quickly recover our user files as
as well as the bulk of our configuration using these precautions.
