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

Currently implemented features are:

* option `-f` ("default" by default): Specifies a cow picture file ('cowfile') to use.
* option `-e` ("oo" by default): Select the appearance of the cow's eyes.
* option `-T` ("  " by default): The tongue is configurable similarly to the eyes through -T and tongue_string.
* option `-W` (40 by default): Specifies roughly where the message should be wrapped. The default is equivalent to -W 40 i.e. wrap words at or before the 40th column.

## Usage as a package

`cl-cowsay` can be used programmatically.

```
; If you didn't install with roswell, clone this repo to anywhere in the asdf registry
(ql:quickload '#:cl-cowsay)
(cl-cowsay:final-cow "CL is great"
                     :file "default"
                     :eye "oo"
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

