# cl-cowsay

```
 ______
< Moo! >
 ------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

cowsay is a configurable talking cow, originally written in Perl by [Tony Monroe](https://github.com/tnalpgge/rank-amateur-cowsay)

This project is a translation in Common Lisp of the original program and an attempt to bring the same silliness to CL.

## Install

The CLI is implemented with [roswell](https://github.com/roswell/roswell), so you would be able to install `cl-cowsay` with it.

``` shell
ros install pcr910303/cl-cowsay
```

## Usage

``` shell
cowsay -e '$$' CL is great!
```

```
 ______________
< CL is great! >
 --------------
        \   ^__^
         \  ($$)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

It is being implemented with the goal to be exactly same with the original cowsay.

Currently all options are implemented:

```
Usage: cl-cowsay [-h|--help] [-b|--borg] [-d|--dead] [-g|--greedy]
                 [-p|--paranoia] [-s|--stoned] [-t|--tired] [-w|--wired] [-y|--youthful]
                 [-e|--eyes ARG] [-T|--tongue ARG] [-n|--no-wrap] [-W|--wrap ARG]
                 [-f|--file ARG] [-r|--random] [-l|--list] [FREE-ARGS]

Available options:
  -h, --help               Display this help message
  -b, --borg               Mode: Borg
  -d, --dead               Mode: Dead
  -g, --greedy             Mode: Greedy
  -p, --paranoia           Mode: Paranoia
  -s, --stoned             Mode: Stoned
  -t, --tired              Mode: Tired
  -w, --wired              Mode: Wired
  -y, --youthful           Mode: Youthful
  -e, --eyes ARG           Select the appearance of the cow's eyes.
  -T, --tongue ARG         The tongue is configurable similarly to the eyes through -T and tongue_string.
  -n, --no-wrap            If it is specified, the given message will not be word-wrapped.
  -W, --wrap ARG           Specifies roughly where the message should be wrapped. The default is equivalent to -W 40 i.e. wrap words at or before the 40th column.
  -f, --file ARG           Specifies a cow picture file ('cowfile') to use. It can be either a path to a cow file or the name of one of cows included in the package.
  -r, --random             Select a random cow
  -l, --list               List all cowfiles included in this package.
```

## Usage as a package

`cl-cowsay` can be used programmatically.

```
; If you didn't install with roswell, clone this repo to anywhere in the asdf registry
(ql:quickload '#:cl-cowsay)
(cl-cowsay:cowsay "CL is great"
                  :file "default"
                  :eyes "oo"
                  :tongue "  "
                  :thoughts "\\"
                  :wrap 40)
(princ *)
```

produces...

```
 _____________
< CL is great >
 -------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

