# Password Generator

I wrote a small script in bash that allows you to generate passwords (which you are constantly asked for :).
The script generates a password of a given length from 4 to 64 characters in Latin.

For example:
```bash
~ > genpass 32                                                                     
HRYYDzxxKEjDzSyGcahZGkrIxbHutESE
~ >
```

## QuickStart
- Copy [script](./generate_password.sh) to `/scripts/generate_password.sh` or another directory
- `sh /scripts/generate_password.sh`

## Copy directly to clipboard
To copy directly to the clipboard I use `xclip`. First you need to install xclip:
```bas
apt update && apt install xclip
```
After successful installation, you need to add the call function to your `.bashrc`:
```bash
genpass() {
  sh /scripts/generate_password.sh $1 | xclip -sel clip && xclip -sel clip
}
```
