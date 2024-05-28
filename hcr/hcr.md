## NAME
       hcr - HolyC Runner compile and run HolyC scripts

## SYNOPSIS
       hcr [options] [file]

## DESCRIPTION
       hcr is a script to compile and run HolyC code. It can be used in various ways:
       • As a script interpreter with a shebang #!/usr/local/bin/hcr.
       • By passing a file as a parameter.
       • By directing the HolyC code to be run from stdin.
       • By using a quoted string as a parameter with the -s option.

## DEPENDS ON
       hcc HolyC Compiler holyc-lang https://github.com/Jamesbarford/holyc-lang

## OPTIONS
       -s "HolyC code"
              Compile and run the HolyC code provided as a string.

       stdin  Compile and run the HolyC code provided as stdin.

       shebang
              Compile and run the HolyC code provided in a file with a shebang.

## USAGE
       hcr file.HC
              Compile and run the HolyC script provided in file.HC.

       cat myscript.HC | hcr
              Compile and run the HolyC code provided in stdin.

       hcr -s '"Hello World\n";'
              Compile and run the HolyC code provided as a string.

        ./myscript.HC
              Compile and run the HolyC code provided in file with shebang.

## EXAMPLES
       Compiles and runs the provided HolyC code from stdin.
              • cat myscript.HC | hcr
              • echo '"Hello World\n";' | hcr
              • hcr < myscript.HC
              • hcr << EOF
              "Hello World\n";
              EOF

       shebang
              HolyC  script  for this example myscript.HC will be used. The first line is #!/usr/local/bin/hcr , the
              execute file permission needs to ne given to the script.

              chmod u+x myscript.HC

              file content:
              #!/usr/local/bin/hcr
              "Hello World\n";

              to run:
               ./myscript.HC

       Compile and run the HolyC code provided as a string.
              hcr -s '"Hello World\n";'

       Compile and run the HolyC code file provided as a parameter.
              hcr myscript.HC

## SEE ALSO
       bash(1), hcc(1) https://github.com/Jamesbarford/holyc-lang