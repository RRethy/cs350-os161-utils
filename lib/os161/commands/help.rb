module OS161
  module Commands
    class Help
      class << self
        def call
          puts <<-EOF
os161util [OPTION]

os161 is a utility command to help with the development of os161 in CS350 at
UWaterloo.

os161 will execute all your commands without fucking up your current working
directory, you also won't have to cd everywhere because that sucks shit.

Options can be combined and ordering will not get wack; building will always be
done before running anything. For example, `--run --build` will build the
kernel, then run the simulator.

OPTIONS:
--help, -h:
    show help
--build, -b:
    build the kernel specified by -r (which has a good default heuristic).
--run <cmd>, -r <cmd>:
    run the simulator with the kernel specified by -r (which has a good default heuristic).
    <cmd> can be passed and the simulator will run it and exit.
    These would be pretty much the same:
    $ os161 -r "sp3 1 150 1 1 0"
    $ sys161 kernel "sp3 1 150 1 1 0;q"
--assignment_number integer, -r integer:
    specifies which kernel version to build and use.
    By default it'll use a heuristic based on hardcoded assignment deadlines
    for W20 to determine which version of the kernel to build. You can specify
    a specific kernel version with --assignment_number (-r).
EOF
        end
      end
    end
  end
end
